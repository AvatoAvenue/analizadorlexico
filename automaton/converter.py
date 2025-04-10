import os
import xml.etree.ElementTree as ET
import subprocess

INPUT_DIR = r"E:\proyectos_activos\analizadorlexico\automaton\archivos"
OUTPUT_DIR = r"E:\proyectos_activos\analizadorlexico\automaton\imagen"

if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

def jff_to_dot(jff_path):
    tree = ET.parse(jff_path)
    root = tree.getroot()
    states = {}
    transitions = []

    for state in root.iter('state'):
        id = state.get('id')
        name = state.get('name')
        x = int(float(state.find('x').text))
        y = int(float(state.find('y').text))
        if name is None:
            name = f"q{state.get('id')}"
        label = name
        if state.find('initial') is not None:
            label += " (I)"
        if state.find('final') is not None:
            label += " (F)"
        states[id] = (name, label)

    for trans in root.iter('transition'):
        from_id = trans.find('from').text
        to_id = trans.find('to').text
        read = trans.find('read').text or "ε"
        transitions.append((from_id, to_id, read))

    dot_lines = ["digraph finite_state_machine {", "rankdir=LR;", "node [shape = circle];"]

    for id, (name, label) in states.items():
        dot_lines.append(f'{name} [label="{label}"];')

    for from_id, to_id, read in transitions:
        from_name = states[from_id][0]
        to_name = states[to_id][0]
        dot_lines.append(f'{from_name} -> {to_name} [label="{read}"];')

    dot_lines.append("}")
    return "\n".join(dot_lines)

for filename in os.listdir(INPUT_DIR):
    if filename.endswith(".jff"):
        jff_path = os.path.join(INPUT_DIR, filename)
        base_name = os.path.splitext(filename)[0]
        dot_code = jff_to_dot(jff_path)
        dot_file = os.path.join(OUTPUT_DIR, f"{base_name}.dot")
        png_file = os.path.join(OUTPUT_DIR, f"{base_name}.png")

        with open(dot_file, "w", encoding="utf-8") as f:
            f.write(dot_code)

        subprocess.run(["dot", "-Tpng", dot_file, "-o", png_file])
