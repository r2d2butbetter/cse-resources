Network Protocol Series RFC 959: File Transfer Protocol (FTP)
=================================================================

The File Transfer Protocol (FTP) is a standard network protocol used for transferring files between two computers over a network. It operates at the application layer (layer 7) of the OSI model and uses the Transmission Control Protocol (TCP) at the transport layer (layer 4) for reliable data transfer.

FTP follows a client-server model architecture, where the client program initiates a connection request to the server program. By default, the FTP server uses TCP port 20 for data transfer and port 21 for the control connection. This separation of control and data connections allows FTP to efficiently transfer large amounts of data.

FTP was first proposed by Abhay Bhushan in 1971, initially published as RFC 114. The commonly used version of FTP is described in detail in RFC 959 (1985), with subsequent RFCs providing extensions and updates, such as RFC 2228 (1997) defining FTP security extensions.

How FTP Works

FTP uses two parallel TCP connections between the client and server: a control connection and a data connection.

Control connection:

*   Remains open throughout the FTP session
*   Used for sending FTP commands and receiving server responses
*   Allows the client to interact with the server for authentication, directory changes, and file transfer requests

Data connection:

*   Opened and closed as needed
*   Used exclusively for transferring directory listings and file data
*   Each file transfer or directory listing may require a separate data connection
*   Two modes for data connection: active mode (PORT) and passive mode (PASV)

Here’s a detailed breakdown of the interaction between the FTP client and server:

Establishing the Control Connection

```
Client -------------------- Server
              TCP 21
```

The client establishes a control connection with the FTP server using TCP port 21. Upon connection, the server sends a welcome message, such as “220 Service ready”.

User Authentication

```
Client                        Server
    |                             |
    |--------- USER username ---->|
    |                             |
    |<-- 331 User name okay, -----|
    |        need password        |
    |                             |
    |-------- PASS password ----->|
    |                             |
    |<-- 230 User logged in, -----|
    |         proceed             |
    |                             |
           (Successful authentication)
           
           
  Client                        Server        
    |                             |
    |-------- USER username ----->|
    |                             |
    |<--- 530 Login incorrect ----|
    |                             |
    |----------- QUIT ----------->|
    |                             |
    |<-- 221 Service closing -----|
    |     control connection      |
    |                             |
           (Failed authentication)
```

The client sends the username using the USER command and the password using the PASS command for authentication. Anonymous FTP can use “anonymous” as the username and usually requires no password or the user’s email address as the password.

Directory Navigation and File Transfer Requests

```
Client -------------------- Server
      CWD, LIST, RETR, STOR, etc.
    -------------------------------->
      Directory listings, file data, etc.  
    <--------------------------------
```

After successful authentication, the client can send a series of FTP commands to interact with the server, such as:

*   CWD: Change the current working directory on the server
*   LIST: Request a list of files in the current directory
*   RETR: Download a file from the server
*   STOR: Upload a file to the server

Opening the Data Connection

When the client needs to receive a directory listing or transfer a file, it sends either a PORT command or a PASV command over the control connection to instruct the server to open a separate data connection for the data transfer.

Active mode (PORT):

```
Client                       Server
    |                            |
    |--- PORT 192,168,1,100, --->|
    |        123,456             |
    |                            |
    |                            | Server connects to client's
    |                            | IP 192.168.1.100
    |                            | Port 31272 (123*256+456)
    |                            |
    |---------- LIST ----------->|
    |                            |
    |<=== New data connection ===|
    |                            |
    |<-- 150 File status okay, --|
    |   opening data connection  |
    |                            |
    |<==== Directory listing ====|
    |                            |
    |=== Close data connection =>|
    |                            |
    |<-- 226 Transfer complete --|
    |                            |
```

In active mode, the client informs the server of its data port using the PORT command. The server then actively connects to the specified port on the client from its TCP port 20.

Passive mode (PASV):

```
Client                       Server
    |                            |
    |----------- PASV ---------->| 
    |                            |
    |<-- 227 Entering Passive ---|
    |   Mode (192,168,1,200,     |
    |         123,456)           |
    |                            |
    |                            | Server notifies client to connect
    |                            | to server's IP 192.168.1.200  
    |                            | Port 31272 (123*256+456)
    |                            |
    |---------- LIST ----------->|
    |                            |
    |=== New data connection ===>|
    |                            |
    |<-- 150 File status okay, --|
    |   opening data connection  |
    |                            |
    |<=== Directory listing =====|
    |                            | 
    |=== Close data connection =>|
    |                            |
    |<-- 226 Transfer complete --|
    |                            |
```

In passive mode, the client sends the PASV command, and the server responds by randomly opening a data port (greater than 1023) and informing the client. The client then actively connects to this port on the server for data transfer.

Data Transfer

Once the data connection is established, the server sends the requested data (e.g., directory listing or file contents) over this connection to the client. After the transfer is complete, the server closes the data connection. The control connection remains open throughout this process.

Terminating the FTP Session

```
Client                       Server
    |                            |
    |----------- QUIT ---------->|
    |                            |
    |<-- 221 Service closing ----|
    |     control connection     |
    |                            |
    |=Close control connection =>|
    |                            |
```

When the client has finished all operations, it terminates the FTP session with the QUIT command. The server sends an acknowledgment message, and then the client closes the control connection.

FTP Message Format

FTP uses NVT ASCII-based commands and responses for communication. Both commands and responses end with a carriage return and line feed (CRLF, i.e., \r\n).

Command format:

```
COMMAND_NAME [ARGUMENTS] CRLF
```

Examples:

```
USER anonymous\r\n
RETR filename.txt\r\n
```

Response format:

```
THREE_DIGIT_CODE [RESPONSE_TEXT] CRLF
```

Examples:

```
230 User logged in, proceed\r\n
150 File status okay, opening data connection\r\n
226 Transfer complete\r\n
```

The three-digit response code indicates the result of the command execution:

*   1xx: Positive preliminary reply, e.g., 150
*   2xx: Positive completion reply, e.g., 200, 226, 250
*   3xx: Positive intermediate reply, e.g., 331, 350
*   4xx: Transient negative completion reply, e.g., 421, 450, 451
*   5xx: Permanent negative completion reply, e.g., 500, 501, 530

Each FTP command may have multiple responses, with the response codes indicating different stages and results of command processing.

Security Considerations

Standard FTP does not encrypt data or credentials during transmission, posing the following security risks:

*   Commands and responses are transmitted in plaintext, vulnerable to eavesdropping and tampering
*   User credentials are sent over the network in plaintext, easily intercepted
*   Data is transferred in plaintext, susceptible to monitoring and theft

To address these issues, secure variants of FTP can be used:

FTPS (FTP over SSL/TLS):

*   Adds Transport Layer Security (TLS) to standard FTP
*   Performs SSL/TLS handshake immediately after establishing the TCP connection, encrypting both control and data connections
*   Requires FTP server and client that support SSL/TLS
*   Typically uses port 990 for implicit FTPS or sends an explicit “AUTH TLS” command on port 21 to enable TLS

SFTP (SSH File Transfer Protocol):

*   A file transfer protocol based on the Secure Shell (SSH) protocol, not related to FTP
*   Uses a single SSH connection for authentication, command transmission, and data transfer, typically over port 22
*   Leverages SSH’s security features to encrypt and authenticate all communication
*   Requires an SFTP-enabled SSH server (e.g., OpenSSH) and SFTP client (e.g., FileZilla, WinSCP)

Conclusion

FTP, as a basic file transfer protocol, has laid the foundation for modern file transfer. It is simple, efficient, and widely implemented. Although it lacks built-in security, its core concepts, such as the separation of control and data connections, command and response formats, have influenced the design of subsequent secure protocols.

By studying RFC 959, we gain a deep understanding of FTP’s inner workings, including its connection model, transfer modes, message formats, and response codes. This knowledge helps us better appreciate modern file transfer protocols like FTPS and SFTP.

In real-world applications, we should prioritize secure FTP variants or other proprietary solutions to ensure data security. However, understanding FTP’s design principles and limitations is crucial for correctly evaluating and selecting file transfer solutions.
