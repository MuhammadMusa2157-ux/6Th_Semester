import socket

# Create socket object
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(('localhost', 12345))

# Send message
client_socket.send("Hello Server!".encode())

# Receive response
response = client_socket.recv(1024).decode()
print(f"Received from server: {response}")

# Close socket
client_socket.close()

