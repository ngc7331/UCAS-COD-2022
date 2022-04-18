def main():
    inst = input('[input] Instruction Code: ')
    if inst.startswith('0x'):
        inst = bin(int(inst, 16))[2:]
    elif inst.startswith('0b'):
        inst = inst[2:]
    else:
        inst = bin(int(inst))[2:]

    inst = '{:0>32}'.format(inst)
    print(f'Instruction Code: {inst}')
    # inst is the binary code

    opcode = inst[0:6]
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
        func = inst[26:32]
        print(f'Type: r')
        print(f'opcode\trs\trt\trd\tshamt\tfunc')
        print(f'{opcode}\t{rs}\t{rt}\t{rd}\t{shamt}\t{func}')
        print(f'Instruction: {d[func]}')

    elif inst.startswith('000001'):
        d = {
            '00000': 'bltz',
            '00001': 'bgez',
        }
        rs = inst[6:11]
        reg = inst[11:16]
        imm = inst[16:32]
        print(f'Type: regimm')
        print(f'opcode\trs\tREG\timm')
        print(f'{opcode}\t{rs}\t{reg}\t{imm}')
        print(f'Instruction: {d[reg]}')

    elif inst.startswith('00001'):
        t = 'j'
    elif inst.startswith('0001'):
        t = 'i-branch'
    elif inst.startswith('001'):
        t = 'i-caculate'
    elif inst.startswith('1'):
        t = 'i-mem'
    else:
        raise ValueError('invalid instruction')

if __name__ == '__main__':
    while True:
        try:
            main()
        except KeyboardInterrupt:
            exit()
        except Exception:
            pass