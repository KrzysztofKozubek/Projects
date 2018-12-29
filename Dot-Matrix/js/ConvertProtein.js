class ConvertProtein {

    static convertStringToFunction(nameFunction) {
        switch (nameFunction) {
            case 'Atom' :
                return ConvertProtein.funAllAtoms;
            case 'Polar' :
                return ConvertProtein.funPolarNOS;
            case 'Rotate' :
                return ConvertProtein.funRotateBonds;
            case 'Hydro' :
                return ConvertProtein.funHydro;
            case 'Similar' :
                return ConvertProtein.funSimilar;
        }
        return null;
    }

    static convertStringToCompareFunction(nameFunction) {
        switch (nameFunction) {
            case 'Atom' :
                return ManagerProtein.correlationCoefficient;
            case 'Polar' :
                return ManagerProtein.correlationCoefficient;
            case 'Rotate' :
                return ManagerProtein.correlationCoefficient;
            case 'Hydro' :
                return ManagerProtein.correlationCoefficient;
            case 'Similar' :
                return ManagerProtein.similaritySequence;
        }
        return null;
    }

    static getValueAA(sequence, fun) {
        return sequence.split(/(?=[A-Z])/)
            .map((letter) => {
                return fun(letter);
            });
    }

    static funAllAtoms(sequence) {
        const atoms = {
            'D': 4, 'Asp': 4,
            'S': 2, 'Ser': 2,
            'T': 3, 'Thr': 3,
            'G': 0, 'Gly': 0,
            'P': 3, 'Pro': 3,
            'C': 2, 'Cys': 2,
            'A': 1, 'Ala': 1,
            'V': 3, 'Val': 3,
            'I': 4, 'Ile': 4,
            'L': 4, 'Leu': 4,
            'M': 4, 'Met': 4,
            'F': 7, 'Phe': 7,
            'Y': 8, 'Tyr': 8,
            'W': 10, 'Trp': 10,
            'H': 6, 'His': 6,
            'R': 6, 'Arg': 6,
            'K': 5, 'Lys': 5,
            'N': 4, 'Asn': 4,
            'Q': 5, 'Gln': 5,
            'E': 5, 'Glu': 5,
        };
        return atoms[sequence];
    }

    static funPolarNOS(sequence) {
        const polar = {
            'D': 2, 'Asp': 2,
            'S': 1, 'Ser': 1,
            'T': 1, 'Thr': 1,
            'G': 0, 'Gly': 0,
            'P': 0, 'Pro': 0,
            'C': 1, 'Cys': 1,
            'A': 0, 'Ala': 0,
            'V': 0, 'Val': 0,
            'I': 0, 'Ile': 0,
            'L': 0, 'Leu': 0,
            'M': 1, 'Met': 1,
            'F': 0, 'Phe': 0,
            'Y': 1, 'Tyr': 1,
            'W': 1, 'Trp': 1,
            'H': 2, 'His': 2,
            'R': 3, 'Arg': 3,
            'K': 1, 'Lys': 1,
            'N': 2, 'Asn': 2,
            'Q': 2, 'Gln': 2,
            'E': 2, 'Glu': 2,
        };
        return polar[sequence];
    }

    static funRotateBonds(sequence) {
        const rotate = {
            'D': 2, 'Asp': 2,
            'S': 1, 'Ser': 1,
            'T': 2, 'Thr': 2,
            'G': 0, 'Gly': 0,
            'P': 0, 'Pro': 0,
            'C': 1, 'Cys': 1,
            'A': 0, 'Ala': 0,
            'V': 2, 'Val': 2,
            'I': 2, 'Ile': 2,
            'L': 3, 'Leu': 3,
            'M': 3, 'Met': 3,
            'F': 2, 'Phe': 2,
            'Y': 2, 'Tyr': 2,
            'W': 2, 'Trp': 2,
            'H': 2, 'His': 2,
            'R': 4, 'Arg': 4,
            'K': 4, 'Lys': 4,
            'N': 2, 'Asn': 2,
            'Q': 3, 'Gln': 3,
            'E': 3, 'Glu': 3,
        };
        return rotate[sequence];
    }

    static funHydro(sequence) {
        const rotate = {
            'D': 0.167, 'Asp': 0.167,
            'S': 0.422, 'Ser': 0.422,
            'T': 0.478, 'Thr': 0.478,
            'G': 0.550, 'Gly': 0.550,
            'P': 0.300, 'Pro': 0.300,
            'C': 1.000, 'Cys': 1.000,
            'A': 0.572, 'Ala': 0.572,
            'V': 0.811, 'Val': 0.811,
            'I': 0.883, 'Ile': 0.883,
            'L': 0.783, 'Leu': 0.783,
            'M': 0.828, 'Met': 0.828,
            'F': 0.906, 'Phe': 0.906,
            'Y': 0.700, 'Tyr': 0.700,
            'W': 0.856, 'Trp': 0.856,
            'H': 0.628, 'His': 0.628,
            'R': 0.272, 'Arg': 0.272,
            'K': 0.001, 'Lys': 0.001,
            'N': 0.278, 'Asn': 0.278,
            'Q': 0.250, 'Gln': 0.250,
            'E': 0.083, 'Glu': 0.083,
        };
        return rotate[sequence];
    }

    static funSimilar(sequence) {
        const rotate = {
            'D': 1, 'Asp': 1,
            'S': 2, 'Ser': 2,
            'T': 3, 'Thr': 3,
            'G': 4, 'Gly': 4,
            'P': 5, 'Pro': 5,
            'C': 6, 'Cys': 6,
            'A': 7, 'Ala': 7,
            'V': 8, 'Val': 8,
            'I': 9, 'Ile': 9,
            'L': 10, 'Leu': 10,
            'M': 11, 'Met': 11,
            'F': 12, 'Phe': 12,
            'Y': 13, 'Tyr': 13,
            'W': 14, 'Trp': 14,
            'H': 15, 'His': 15,
            'R': 16, 'Arg': 16,
            'K': 17, 'Lys': 17,
            'N': 18, 'Asn': 18,
            'Q': 19, 'Gln': 19,
            'E': 20, 'Glu': 20,
        };
        return rotate[sequence];
    }

}