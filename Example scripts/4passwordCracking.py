import hashlib

password = "hunter2"
hashed_password = hashlib.md5(password.encode()).hexdigest()

print(f"Original Password: {password}")
print(f"Hashed Password: {hashed_password}")