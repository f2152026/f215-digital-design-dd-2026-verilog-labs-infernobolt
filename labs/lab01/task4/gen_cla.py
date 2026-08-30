# gen_cla.py
def generate_carry_equations(n):
    for i in range(1, n + 1):
        terms = [f"g[{i-1}]"]
        for j in range(1, i):
            ps = " & ".join(f"p[{i-k}]" for k in range(1, j+1))
            terms.append(f"({ps} & g[{i-j-1}])")
        
        # Final term with cin
        ps = " & ".join(f"p[{k}]" for k in range(i-1, -1, -1))
        terms.append(f"({ps} & cin)")
        
        print(f"  assign #(2) c[{i}] = " + " | ".join(terms) + ";")

generate_carry_equations(64)