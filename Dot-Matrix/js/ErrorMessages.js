class ErrorMessages {

    static getMessage(label) {
        switch (label) {
            case 'incorrectIdStructure':
                return 'Structure protein should contain with pattern: {Number Letter|Number Letter|Number Letter|Number} eg: 1DVQ';

            case 'idStructureNoExists':
                return 'DataBase PDB doesn\'t contain protein with that id structure';
        }
    }
}