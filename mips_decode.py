def printTable(**table):
    title = content = ''
    for (key, value) in table.items():
        title += f'{key}\t'
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

    opcode = inst[:6]
    if inst.startswith('000000'):
        d = {
            '100001': 'addu',
            '100011': 'subu',
            '100100': 'and',
            '100101': 'or',
            '100110': 'xor',
            '100111': 'nor',
            '101010': 'slt',
            '101011': 'sltu',

            '000000': 'sll',
            '000011': 'sra',
            '000010': 'srl',
            '000100': 'sllv',
            '000111': 'srav',
            '000110': 'srlv',

            '001000': 'jr',
            '001001': 'jalr',

            '001010': 'movz',
            '001011': 'movn',
        }
        rs = inst[6:11]
        rt = inst[11:16]
        rd = inst[16:21]
        shamt = inst[21:26]
        func = inst[26:]
        print(f'Type: R')
        printTable(opcode=opcode, rs=rs, rt=rt, rd=rd, shamt=shamt, func=func)
        print(f'Instruction: {d[func]}')

    elif inst.startswith('000001'):
        d = {
            '00000': 'bltz',
            '00001': 'bgez',
        }
        rs = inst[6:11]
        reg = inst[11:16]
        imm = inst[16:]
        print(f'Type: REGIMM')
        printTable(opcode=opcode, rs=rs, REG=reg, imm=imm)
        print(f'Instruction: {d[reg]}')

    elif inst.startswith('00001'):
        d = {
            '0': 'j',
            '1': 'jal',
        }
        instr_index = inst[6:32]
        print(f'Type: J')
        printTable(opcode=opcode, instr_index=instr_index)
        print(f'Instruction: {d[opcode[5]]}')
    elif inst.startswith('0001'):
        d = {
            '00': 'beq',
            '01': 'bne',
            '10': 'blez',
            '11': 'bgtz',
        }
        rs = inst[6:11]
        rt = inst[11:16]
        imm = inst[16:]
        print(f'Type: I-branch')
        printTable(opcode=opcode, rs=rs, rt=rt, imm=imm)
        print(f'Instruction: {d[opcode[4:]]}')
    elif inst.startswith('001'):
        d = {
            '001': 'addiu',
            '111': 'lui',
            '100': 'andi',
            '101': 'ori',
            '110': 'xori',
            '010': 'slti',
            '011': 'sltiu',
        }
        rs = inst[6:11]
        rt = inst[11:16]
        imm = inst[16:]
        print(f'Type: I-caculate')
        printTable(opcode=opcode, rs=rs, rt=rt, imm=imm)
        print(f'Instruction: {d[opcode[3:]]}')
    elif inst.startswith('1'):
        d = {
            '0000': 'lb',
            '0001': 'lh',
            '0011': 'lw',
            '0100': 'lbu',
            '0101': 'lhu',
            '0010': 'lwl',
            '0110': 'lwr',

            '1000': 'sb',
            '1001': 'sh',
            '1011': 'sw',
            '1010': 'swl',
            '1110': 'swr',
        }
        td = {
            '0': 'load',
            '1': 'store',
        }
        base = inst[6:11]
        rt = inst[11:16]
        offset = inst[16:]
        print(f'Type: I-memory{td[opcode[2]]}')
        printTable(opcode=opcode, base=base, rt=rt, offset=offset)
        print(f'Instruction: {d[opcode[2:]]}')
    else:
        raise ValueError('invalid instruction')

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