from math import ceil


def printTable(**table):
    title = content = ''
    for (key, value) in table.items():
        tabs = '\t' * max(0, ceil((len(value)) / 7))
        title += f'{key}{tabs}'
        content += f'{value}\t'
    print(title)
    print(content)


def main():
    inst = input('---\n[input] Instruction Code: ')
    if inst.startswith('0x'):
        inst = bin(int(inst, 16))[2:]
    elif inst.startswith('0b'):
        inst = inst[2:]
    else:
        inst = bin(int(inst))[2:]

    inst = '{:0>32}'.format(inst)
    print(f'Instruction Code: {inst}')
    # inst is the binary code

    opcode = inst[25:]
    funct7 = inst[:7]
    rs2 = shamt = inst[7:12]
    rs1 = inst[12:17]
    funct3 = inst[17:20]
    rd = inst[20:25]
    immI = 20 * inst[0] + inst[:12]
    immS = 20 * inst[0] + inst[:7] + inst[20:25]
    immB = 20 * inst[0] + inst[25] + inst[1:7] + inst[20:25] + '0'
    immU = inst[:20] + 11 * '0'
    immJ = 12 * inst[0] + inst[12:20] + inst[11] + inst[1:11] + '0'
    if opcode == '0110011':
        # R-type
        d = {
            '0000': 'ADD',
            '1000': 'SUB',
            '0001': 'SLL',
            '0010': 'SLT',
            '0011': 'SLTU',
            '0100': 'XOR',
            '0101': 'SRL',
            '1101': 'SRA',
            '0110': 'OR',
            '0111': 'AND',
        }
        print(f'Type: R')
        printTable(funct7=funct7, rs2=rs2, rs1=rs1, funct3=funct3, rd=rd, opcode=opcode)
        print(f'Instruction: {d[funct7[1]+funct3]}')

    elif opcode == '0010011':
        # I-type caculate
        d = {
            '000': 'ADDI',
            '010': 'SLTI',
            '011': 'SLTIU',
            '100': 'XORI',
            '110': 'ORI',
            '111': 'ANDI',

            '0001': 'SLLI',
            '0101': 'SRLI',
            '1101': 'SRAI',
        }
        print(f'Type: I-caculate')
        if funct3 in ['001', '101']:
            printTable(funct7=funct7, shamt=shamt, rs1=rs1, funct3=funct3, rd=rd, opcode=opcode)
            print(f'Instruction: {d[funct7[1]+funct3]}')
        else:
            printTable(immI=immI, rs1=rs1, funct3=funct3, rd=rd, opcode=opcode)
            print(f'Instruction: {d[funct3]}')

    elif opcode == '0100011':
        # S-type
        d = {
            '000': 'SB',
            '001': 'SH',
            '010': 'SW',
        }
        print(f'Type: S')
        printTable(immS=immS, rs2=rs2, rs1=rs1, funct3=funct3, opcode=opcode)
        print(f'Instruction: {d[funct3]}')

    elif opcode == '0000011':
        # I-type load
        d = {
            '000': 'LB',
            '001': 'LH',
            '010': 'LW',
            '100': 'LBU',
            '101': 'LHU',
        }
        print(f'Type: I-load')
        printTable(immI=immI, rs1=rs1, funct3=funct3, rd=rd, opcode=opcode)
        print(f'Instruction: {d[funct3]}')

    elif opcode == '1100011':
        d = {
            '000': 'BEQ',
            '001': 'BNE',
            '100': 'BLT',
            '101': 'BGE',
            '110': 'BLTU',
            '111': 'BGEUs',
        }
        print(f'Type: B')
        printTable(immB=immB, rs2=rs2, rs1=rs1, funct3=funct3, opcode=opcode)
        print(f'Instruction: {d[funct3]}')

    elif opcode == '1100111':
        print(f'Type: I-jump')
        printTable(immI=immI, rs1=rs1, funct3=funct3, rd=rd, opcode=opcode)
        print(f'Instruction: JALR')

    elif opcode == '1101111':
        print(f'Type: J')
        printTable(immJ=immJ, rd=rd, opcode=opcode)
        print(f'Instruction: JAL')

    elif opcode[2:] == '10111':
        d = {
            '1': 'LUI',
            '0': 'AUIPC',
        }
        print(f'Type: U')
        printTable(immU=immU, rd=rd, opcode=opcode)
        print(f'Instruction: {d[opcode[1]]}')


if __name__ == '__main__':
    while True:
        try:
            main()
        except KeyboardInterrupt:
            exit()
        except KeyError:
            print('Invalid instruction')
        except Exception as e:
            print(e)
            pass