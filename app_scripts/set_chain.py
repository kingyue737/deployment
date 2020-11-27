import sys
import openmc.data

lib = openmc.data.DataLibrary.from_xml(sys.argv[0]) # looks for OPENMC_CROSS_SECTIONS if not path provided
lib.register_file(sys.argv[1])
lib.export_to_xml(sys.argv[0])
