import socket

# Create socket object
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('localhost', 12345))
server_socket.listen(1)

print("Server is waiting for client connection...")

# Accept connection
client_socket, address = server_socket.accept()
print(f"Connected to {address}")

# Receive message
message = client_socket.recv(1024).decode()
print(f"Received from client: {message}")

# Send response
client_socket.send("Hello Client, Message received!".encode())

# Close sockets
client_socket.close()
server_socket.close()


