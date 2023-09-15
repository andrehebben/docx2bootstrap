import subprocess
import os
from docx import Document

input_directory = "/sandbox"
input_files = os.listdir(input_directory)

# Function to accept all tracked changes in a DOCX file
def accept_all_changes(docx_file):
    doc = Document(docx_file)
    for paragraph in doc.paragraphs:
        for run in paragraph.runs:
            run.clear()

    doc.save(docx_file)

# Replace these paths with your input and output file paths
input_docx_file = "input.docx"
output_pdf_file = "output.pdf"

# Accept all tracked changes in the input DOCX file
accept_all_changes(input_docx_file)

# Pandoc command to convert DOCX (with accepted changes) to PDF
pandoc_command = [
    "pandoc",
    input_docx_file,
    "-o",
    output_pdf_file,
]

try:
    # Run Pandoc command
    subprocess.run(pandoc_command, check=True)
    print(f"Conversion from DOCX to PDF successful. Output saved to {output_pdf_file}")
except subprocess.CalledProcessError as e:
    print(f"Error: Pandoc conversion failed with error code {e.returncode}")
except FileNotFoundError:
    print("Error: Pandoc not found. Please ensure Pandoc is installed and in your system's PATH.")

