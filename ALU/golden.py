def add(A, B):
    return A + B

def minus(A, B):
    return A - B

def bitwise_and(A, B):
    return A & B

def bitwise_or(A, B):
    return A | B

def bitwise_xor(A, B):
    return A ^ B

def bitwise_nor(A, B):
    return ~(A | B) & 0xFFFFFFFF  # Ensure 32-bit representation

def slt(A, B):
    return int(A < B)

def calculate_result(alu_op, A, B):
    if alu_op == 0:
        return add(A, B)
    elif alu_op == 2:
        return minus(A, B)
    elif alu_op == 4:
        return bitwise_and(A, B)
    elif alu_op == 5:
        return bitwise_or(A, B)
    elif alu_op == 6:
        return bitwise_xor(A, B)
    elif alu_op == 7:
        return bitwise_nor(A, B)
    elif alu_op == 0xA:
        return slt(A, B)

def main():
    with open('testvectors_hex.txt', 'r') as file:
        lines = file.readlines()

    results = []

    for line in lines:
        parts = line.replace("_", "")
        alu_op = int(parts[0], 16)
        a = ""
        b = ""
        for i in range(0, len(parts)):
            if i > 1 and i < 9:
                a += parts[i]
            elif (i > 8):
                b+= parts[i]

        A = int(a, 16)
        B = int(b, 16)
        print("{:08X} {:08X} {:X}".format(A, B, alu_op))
        result = calculate_result(alu_op, A, B)
        results.append(result)

    with open('results.txt', 'w') as file:
        for result in results:
            file.write("{:X}\n".format(result).zfill(8))  # Write result in hexadecimal format, padded with zeros if necessary
    with open('results_2.txt', 'w') as file:
        for i, line in enumerate(lines):
            line = line.strip()
            result = results[i]
            line += "_" + "{:08X}\n".format(result)
            file.write(line)

if __name__ == "__main__":
    main()

