def vulnerable_function(input_data):
    buffer = [0] * 5  # Fixed-size buffer

    # Vulnerable code: No input validation
    for i in range(len(input_data)):
        buffer[i] = input_data[i]

    # Additional code (imagine this is sensitive)
    print("Sensitive data:", buffer)

# Example of exploitation
malicious_input = "A" * 10  # Input with more characters than the buffer
vulnerable_function(malicious_input)
