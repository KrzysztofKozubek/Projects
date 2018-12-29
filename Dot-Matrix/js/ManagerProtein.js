class ManagerProtein {
    constructor(dataFile) {
        const splittedData = dataFile.split('\n');
        this.proteins = [];
        // first index of array contains "structureId,chainId,sequence"
        // last is empty
        for (let i = 1; i < splittedData.length - 1; i++) {
            this.proteins[i] = new Protein(splittedData[i].split('"'));
        }
    }

    static createMatrixValueProtein(seq, fun) {
        let matrix = [];
        for (let i = 0; i < seq.length; i++) {
            matrix[i] = [];
            matrix[i][0] = ManagerProtein.countValue(seq[i], fun);
        }
        return matrix;
    }

    static countValue(seq, fun) {
        return ConvertProtein.getValueAA(seq, fun)
            .reduce((p1, p2) => p1 + p2, 0);
    }

    getActualSequence(element) {
        return this.getSequenceGroup(ManagerForm.getValueSelectedGroupProtein(element));
    }

    static createMatrixCompareProteins(seq1, seq2, window, fun, funCompare, opposite = false) {
        let matrix = [];

        for (let i = 0; i < seq1.length - window; i++) {
            matrix[i] = [];
            for (let j = 0; j < seq2.length - window; j++) {
                matrix[i][j] = ManagerProtein.countSimilarity(
                    seq1.slice(i, i + window),
                    seq2.slice(j, j + window),
                    fun,
                    funCompare,
                    opposite);
            }
        }
        return matrix;
    }

    //seq1.length === seq2.length
    static countSimilarity(seq1, seq2, fun, funCompare, opposite) {
        seq1 = opposite ? this.swapString(seq1) : seq1;
        seq1 = ConvertProtein.getValueAA(seq1, fun);
        seq2 = ConvertProtein.getValueAA(seq2, fun);
        return funCompare(seq1, seq2); //correlationCoefficient || similaritySequence
    }

    static swapString(p_string) {
        let swapedString = '';
        for (let i = p_string.length; i >= 0; i--) {
            swapedString += p_string.charAt(i);
        }
        return swapedString;
    }

    static correlationCoefficient(seq1, seq2) {
        let counter = 0, denominator, first = 0, second = 0;
        let avgSeq1 = ManagerProtein.getAvg(seq1);
        let avgSeq2 = ManagerProtein.getAvg(seq2);

        for (let i = 0; i < seq1.length; i++) {
            counter += (seq1[i] - avgSeq1) * (seq2[i] - avgSeq2);
        }
        for (let i = 0; i < seq1.length; i++) {
            first += Math.pow(seq1[i] - avgSeq1, 2);
            second += Math.pow(seq2[i] - avgSeq2, 2);
        }
        denominator = Math.sqrt(first) * Math.sqrt(second);

        return counter / denominator;
    }

    static similaritySequence(seq1, seq2) {
        let sum = 0;
        for (let i = 0; i < seq1.length; i++) {
            sum += seq1[i] === seq2[i] ? 1 : 0;
        }

        return sum / seq1.length;
    }

    static getAvg(seq) {
        let sum = 0;
        seq.forEach((aa) => { sum += aa; });
        return sum / seq.length;
    }

    getSequenceGroup(groupProtein) {
        return this.proteins
            .filter((protein) => {
                if (protein.groupProtein === groupProtein) {
                    return true;
                }
            })
            .map((protein) => {
                return protein.sequence;
            })[0];
    }

    getListGroupProtein() {
        return this.proteins.map((protein) => {
            return protein.groupProtein;
        });
    }
}