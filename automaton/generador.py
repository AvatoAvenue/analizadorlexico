import pandas as pd
from lxml import etree as ET
import os

def create_jff_automaton(token, er):
    root = ET.Element("structure")
    ET.SubElement(root, "type").text = "fa"
    automaton = ET.SubElement(root, "automaton")

    # Estado inicial
    initial_state = ET.SubElement(automaton, "state", id="0")
    ET.SubElement(initial_state, "x").text = "0"
    ET.SubElement(initial_state, "y").text = "0"
    ET.SubElement(initial_state, "initial")

    state_id = 1
    alternatives = [alt.strip() for alt in er.split("|") if alt.strip()]
    
    if not alternatives:
        return  # Si no hay alternativas válidas, no crear autómata

    num_alt = len(alternatives)

    if num_alt == 1:
        # Procesar única alternativa sin épsilon
        alt = alternatives[0]
        current_state = 0  # Comienza en el estado inicial

        for i, char in enumerate(alt):
            next_state = state_id
            state = ET.SubElement(automaton, "state", id=str(next_state))
            ET.SubElement(state, "x").text = str((i + 1) * 100)
            ET.SubElement(state, "y").text = "0"
            
            # Transición con el carácter actual
            transition = ET.SubElement(automaton, "transition")
            ET.SubElement(transition, "from").text = str(current_state)
            ET.SubElement(transition, "to").text = str(next_state)
            ET.SubElement(transition, "read").text = char

            current_state = next_state
            state_id += 1

        # Marcar último estado como final
        ET.SubElement(automaton.find(f".//state[@id='{current_state}']"), "final")

    else:
        # Procesar múltiples alternativas con épsilon
        max_length = max(len(alt) for alt in alternatives)
        last_states = []

        for idx, alt in enumerate(alternatives):
            # Estado inicial de la alternativa (épsilon desde el estado 0)
            branch_start = state_id
            state = ET.SubElement(automaton, "state", id=str(branch_start))
            ET.SubElement(state, "x").text = "100"
            ET.SubElement(state, "y").text = str(idx * 100)
            state_id += 1

            # Transición épsilon desde el estado inicial
            transition = ET.SubElement(automaton, "transition")
            ET.SubElement(transition, "from").text = "0"
            ET.SubElement(transition, "to").text = str(branch_start)
            ET.SubElement(transition, "read").text = ""

            current_state = branch_start

            # Procesar cada carácter de la alternativa
            for i, char in enumerate(alt):
                next_state = state_id
                state = ET.SubElement(automaton, "state", id=str(next_state))
                ET.SubElement(state, "x").text = str(100 * (i + 2))
                ET.SubElement(state, "y").text = str(idx * 100)
                state_id += 1

                # Transición con el carácter
                transition = ET.SubElement(automaton, "transition")
                ET.SubElement(transition, "from").text = str(current_state)
                ET.SubElement(transition, "to").text = str(next_state)
                ET.SubElement(transition, "read").text = char

                current_state = next_state

            last_states.append(current_state)

        # Crear estado final común
        final_state_id = state_id
        final_state = ET.SubElement(automaton, "state", id=str(final_state_id))
        final_state_x = 100 * (max_length + 2) if max_length > 0 else 200
        ET.SubElement(final_state, "x").text = str(final_state_x)
        ET.SubElement(final_state, "y").text = "0"
        ET.SubElement(final_state, "final")
        state_id += 1

        # Conectar últimos estados al final con épsilon
        for last_state in last_states:
            transition = ET.SubElement(automaton, "transition")
            ET.SubElement(transition, "from").text = str(last_state)
            ET.SubElement(transition, "to").text = str(final_state_id)
            ET.SubElement(transition, "read").text = ""

    # Guardar el archivo
    tree = ET.ElementTree(root)
    tree.write(f"{token}.jff", pretty_print=True, encoding="utf-8", xml_declaration=True)

# Leer Excel y generar autómatas
df = pd.read_excel("automata.xlsx", sheet_name="oficial", header=1)
for _, row in df.iterrows():
    create_jff_automaton(row["Token"], row["ER"])

print("Autómatas generados")
