class Variable {
    /*
    has id elements using in form
    */
    static getIdElementSelectGroupProtein(element) {
        return `select_protein_${element}`;
    }

    static idElementInputIdProtein(element) {
        return `input_protein_${element}`;
    }

    static idElementSelectFunction() {
        return `funOption`;
    }

    static idElementInputSizeWindow() {
        return `input_size_window`;
    }

    static idElementInputThresholdValue() {
        return `input_threshold_value`;
    }

    static idElementButtonCompare() {
        return `button_compare`;
    }

    static getIdElementLabelProtein(element) {
        return `label_protein_${element}`;
    }

    static getIdElementCheckboxOppositeWindow() {
        return `checkbox_opposite_window`;
    }
}