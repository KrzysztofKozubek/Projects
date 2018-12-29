class ManagerForm {

    static downloadIfIsValid(element) {
        managerProtein[element] = null;
        ManagerForm.changeErrorInputProtein(element, 'incorrectIdStructure');
        ManagerForm.validateIdStructure(element) ? ManagerForm.loadFileFromURL(element) : false;
    }

    /* Is called when: 1. data is downloaded correct 2. user changes gr, window, function */
    static loadChartProtein(element) {
        this.getValueCheckboxOppositeWindow();
        if (managerProtein.hasOwnProperty(element) && managerProtein[element] !== null) {
            const fun = ManagerForm.getSelectedFunction();
            const seq = managerProtein[element].getSequenceGroup(ManagerForm.getValueSelectedGroupProtein(element));

            const vector = ManagerProtein.createMatrixValueProtein(seq, fun);
            const sequence = managerProtein[element].getActualSequence(element);
            let chart = new Chart(vector, 0, sequence);
            chart.generateSimpleChart(element);
        }
    }

    static countSimilarityProteins() {
        if (ManagerForm.validationForm()) {
            const fun = ManagerForm.getSelectedFunction();
            const funCompare = ManagerForm.getSelectedCompareFunction();
            const seq1 = managerProtein['first'].getSequenceGroup(ManagerForm.getValueSelectedGroupProtein('first'));
            const seq2 = managerProtein['second'].getSequenceGroup(ManagerForm.getValueSelectedGroupProtein('second'));
            const opposite = this.getValueCheckboxOppositeWindow();
            const sizeWindow = parseInt(ManagerForm.getValueInputSizeWindow());
            const thresholdValue = ManagerForm.getValueInputThresholdValue() / 100;

            const matrix = ManagerProtein.createMatrixCompareProteins(seq1, seq2, sizeWindow, fun, funCompare, opposite);
            chart = new Chart(matrix, thresholdValue, []);
            chart.generateCompareChart();
            ManagerForm.setCompareTabActive();
        }
    }

    static checkForm(element) {
        if (ManagerForm.validationForm()) {
            ManagerForm.setActiveButtonCompare();
        } else {
            ManagerForm.setDisableButtonCompare();
            element !== null ? ManagerForm.refreshForm(element) : null;
        }
    }

    /* update value on form */
    static refreshForm(element) {
        if (managerProtein.hasOwnProperty(element) && managerProtein[element] !== null) {
            ManagerForm.feedSelectGroupStructure(element);
        } else {
            ManagerForm.clearSelectGroupStructure(element);
        }
    }

    static refreshSelect(element) {
        ManagerForm.clearSelectGroupStructure(element);
        ManagerForm.feedSelectGroupStructure(element);
    }

    static clearSelectGroupStructure(element) {
        $(`select#${Variable.getIdElementSelectGroupProtein(element)}`).find('option').remove();
        $(`div#chart_${element}`).empty();
        $(`select`).material_select();
    }

    static feedSelectGroupStructure(element) {
        ManagerForm.clearSelectGroupStructure(element);
        managerProtein[element].getListGroupProtein().forEach((groupProtein) => {
            ManagerForm.addOptionToSelect(element, new Option(groupProtein, groupProtein));
        });
        $(`select`).material_select();
    }
    /* update value on form */

    /* validate */
    static validationForm() {
        return !!(
            ManagerForm.validateIdStructure('first') &&
            ManagerForm.validateIdStructure('second') &&
            ManagerForm.validateFunction() &&
            ManagerForm.validateThreshold() &&
            ManagerForm.validateWindow()
        )
    }

    static validateIdStructure(element) {
        return !!(ManagerForm.getValueInputIdProtein(element).length === 4 &&
            ManagerForm.getValueInputIdProtein(element).match('[0-9]{1}([A-Za-z0-9]){3}$'));
    }

    static validateFunction() {
        return ConvertProtein.convertStringToFunction(ManagerForm.getValueSelectedFunction()) !== null;
    }

    static validateThreshold() {
        return !!(
            ManagerForm.getValueInputThresholdValue() > 0 &&
            ManagerForm.getValueInputThresholdValue() <= 100 &&
            ManagerForm.getValueInputThresholdValue().match('^[0-9]+$'));
    }

    static validateWindow() {
        return !!(
            ManagerForm.getValueInputSizeWindow() > 0 &&
            ManagerForm.getValueInputSizeWindow() <= 20 &&
            ManagerForm.getValueInputSizeWindow().match('^[0-9]+$'));
    }
    /* validate */

    /* getters */
    static getValueInputThresholdValue() {
        return $(`input#${Variable.idElementInputThresholdValue()}`).val();
    }

    static getValueInputSizeWindow() {
        return $(`input#${Variable.idElementInputSizeWindow()}`).val();
    }

    static getValueInputIdProtein(element) {
        return $(`input#${Variable.idElementInputIdProtein(element)}`).val();
    }

    static getValueSelectedFunction() {
        return $(`select#${Variable.idElementSelectFunction()} option:selected`).text();
    }

    static getValueSelectedGroupProtein(element) {
        return $(`select#${Variable.getIdElementSelectGroupProtein(element)} option:selected`).text();
    }

    static getSelectedFunction() {
        return ConvertProtein.convertStringToFunction(ManagerForm.getValueSelectedFunction());
    }

    static getSelectedCompareFunction() {
        return ConvertProtein.convertStringToCompareFunction(ManagerForm.getValueSelectedFunction());
    }

    static getValueCheckboxOppositeWindow() {
        return $(`input#${Variable.getIdElementCheckboxOppositeWindow()}`).is(':checked');
    }
    /* getters */

    /* support form element */
    static setActiveButtonCompare() {
        $(`button#${Variable.idElementButtonCompare()}`).removeAttr('disabled');
    }
    static setDisableButtonCompare() {
        $(`button#${Variable.idElementButtonCompare()}`).attr('disabled', true);
    }
    static addOptionToSelect(element, option) {
        let elementSelect = Variable.getIdElementSelectGroupProtein(element);
        $(option).html(option.value);
        $(`select#${elementSelect}`).append(option);
    }
    static setCompareTabActive() {
        $('li#tab_compared').removeClass('disabled');
        $('ul.tabs').tabs('select_tab', 'compared');
    }
    static changeErrorInputProtein(element, labelDictionary) {
        $(`label#${Variable.getIdElementLabelProtein(element)}`)
            .attr('data-error', ErrorMessages.getMessage(labelDictionary));
    }
    static checkProteinExists(data, element) {
        if (data.split('\n').length <= 2) {
            ManagerForm.changeErrorInputProtein(element, 'idStructureNoExists');
            $(`input#${Variable.idElementInputIdProtein(element)}`).addClass('invalid');
            $(`input#${Variable.idElementInputIdProtein(element)}`).prop("aria-invalid", "true");
            ManagerForm.clearSelectGroupStructure(element);
            return false;
        }
        return true;
    }
    /* support form element */

    static loadFileFromURL(element) {
        const url = `http://www.rcsb.org/pdb/rest/customReport.csv?pdbids=${ManagerForm.getValueInputIdProtein(element)}&customReportColumns=sequence&service=wsfile&format=csv`;
        console.log(url);
        $.ajax({
            url: url,
            type: 'GET',
            crossDomain: true,
            dataType: 'text',
            contentType: 'text/plain',
            success: function (data) {
                if (ManagerForm.checkProteinExists(data, element)) {
                    managerProtein[element] = new ManagerProtein(data);
                    ManagerForm.refreshSelect(element);
                    ManagerForm.loadChartProtein(element);
                }
            },
            error: function (err) {
                console.log(err);
                managerProtein[element] = null;
            }
        });
    }

}