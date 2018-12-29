class Chart {
    constructor(matrix, thresholdValue, sequence) {
        this.chartPoint = [];
        this.chartCompare = null;
        this.chartSimple = [];
        this.maxValueX = 0;
        this.maxValueY = 0;

        for (let x = 0; x < matrix.length; x++) {
            const aa = sequence.hasOwnProperty(x) ? sequence[x] : '';
            for (let y = 0; y < matrix[x].length; y++) {
                if (thresholdValue <= matrix[x][y]) {
                    this.chartPoint.push(new Point(x + 1, y + 1, matrix[x][y], aa));
                    if (this.maxValueX < x) {this.maxValueX = x;}
                    if (this.maxValueY < y) {this.maxValueY = y;}
                }
            }
        }
        if (this.chartPoint.length <= 0) {
            alert('Chart is empty');
        }
    }

    generateCompareChart() {
        // CLEAR
        if (this.chartCompare !== null) {
            $(`div#chart_compare`).empty();
            this.chartCompare.clear();
            this.chartCompare = null;
        }
        // XY Chart
        this.chartCompare = new AmCharts.AmXYChart();
        this.chartCompare.autoMarginOffset = 50;
        this.chartCompare.zoomOutButtonPadding = 0;
        this.chartCompare.dataProvider = this.chartPoint;
        this.chartCompare.startDuration = 0.001;
        this.chartCompare.sequencedAnimation = false;
        this.chartCompare['titles'] = [{
            'text': Chart.generateTitle(),
            'size': 15
        }];
        // AXES
        // X
        let xAxis = new AmCharts.ValueAxis();
        xAxis.position = 'bottom';
        xAxis.axisAlpha = 0;
        xAxis.minMaxMultiplayer = 1.2;
        xAxis.minimum = 0;
        xAxis.maximum = this.maxValueX + this.maxValueX * 0.02;
        xAxis.title = Chart.generateXAxesTitle('first');
        this.chartCompare.addValueAxis(xAxis);

        // Y
        let yAxis = new AmCharts.ValueAxis();
        yAxis.position = 'left';
        yAxis.axisAlpha = 0;
        yAxis.minMaxMultiplier = 1.2;
        yAxis.minimum = 0;
        yAxis.maximum = this.maxValueY + this.maxValueY * 0.02;
        yAxis.title = Chart.generateXAxesTitle('second');
        this.chartCompare.addValueAxis(yAxis);

        // GRAPHS
        let graph = new AmCharts.AmGraph();
        graph.valueField = 'value';
        graph.animationPlayed = false;
        graph.bulletOffset = 10;
        graph.colorField = 'color';
        graph.xField = 'x';
        graph.yField = 'y';
        graph.lineAlpha = 0;
        graph.bullet = 'bubble';
        graph.maxBulletSize = 13;
        graph.minBulletSize = 5;
        graph.bulletSize = 'value';
        graph.balloonText = 'x:<b>[[x]]</b> y:<b>[[y]]</b><br>similarity:<b>[[value]]</b>';
        this.chartCompare.addGraph(graph);

        // CURSOR
        let chartCursor = new AmCharts.ChartCursor();
        chartCursor.valueLineBalloonEnabled = true;
        this.chartCompare.addChartCursor(chartCursor);

        // SCROLLBAR
        let chartScrollbar = new AmCharts.ChartScrollbar();
        chartScrollbar.scrollbarHeight = 5;
        chartScrollbar.offset = 15;
        chartScrollbar.dragIconHeight = 25;
        chartScrollbar.dragIconWidth = 25;
        chartScrollbar.gridAlpha = 1;
        this.chartCompare.addChartScrollbar(chartScrollbar);

        this.chartCompare['export'] = {
            'enabled': true
        };
        // WRITE
        this.chartCompare.write('chart_compare');
        // this.chartPoint = null;
    }

    generateSimpleChart(element) {
        // CLEAR
        if (this.chartSimple.hasOwnProperty(element) && this.chartSimple[element] !== null) {
            $(`div#chart_${element}`).empty();
            this.chartSimple[element].clear();
            this.chartSimple[element] = null;
        }
        // XY Chart
        this.chartSimple[element] = new AmCharts.AmSerialChart();
        this.chartSimple[element].dataProvider = this.chartPoint;
        this.chartSimple[element]['titles'] = [{
            'text': Chart.generateTitle(element),
            'size': 15
        }];
        // AXES
        // Y
        let yAxis = new AmCharts.ValueAxis();
        yAxis.position = 'left';
        yAxis.axisAlpha = 0;
        yAxis.minMaxMultiplayer = 1.2;
        yAxis.title = Chart.generateYAxesTitle();
        this.chartSimple[element].addValueAxis(yAxis);

        // Y
        let xAxis = new AmCharts.ValueAxis();
        xAxis.position = 'bottom';
        xAxis.axisAlpha = 0;
        xAxis.minMaxMultiplier = 1.2;
        xAxis.title = 'id window';
        this.chartSimple[element].addValueAxis(xAxis);

        // GRAPHS
        let graph = new AmCharts.AmGraph();
        graph.valueField = 'value';
        graph.bulletSize = 8;
        graph.lineThickness = 2;
        graph.lineColor = '#d1655d';
        graph.negativeLineColor = '#637bb6';
        graph.type = 'smoothedLine';
        graph.balloonText = Chart.generateBalloonText();
        this.chartSimple[element].addGraph(graph);

        // CURSOR
        let chartCursor = new AmCharts.ChartCursor();
        chartCursor.valueLineBalloonEnabled = true;
        this.chartSimple[element].addChartCursor(chartCursor);

        // SCROLLBAR
        let chartScrollbar = new AmCharts.ChartScrollbar();
        chartScrollbar.scrollbarHeight = 5;
        chartScrollbar.offset = 15;
        chartScrollbar.dragIconHeight = 25;
        chartScrollbar.dragIconWidth = 25;
        this.chartSimple[element].addChartScrollbar(chartScrollbar);

        // this.chartSimple[element]['export'] = {
        //     'enabled': true
        // };
        this.chartSimple[element]['categoryField'] = 'x';
        this.chartSimple[element]['categoryAxis'] = {
            'minorGridAlpha': 0.1,
            'minorGridEnabled': true,
            'title': Chart.generateXAxesTitle(element)
        };
        // WRITE
        this.chartSimple[element].write(`chart_${element}`);
        this.chartPoint = null;
    }

    static generateTitle(element) {
        const fun = ManagerForm.getValueSelectedFunction();
        const idStructure = {
            'first': ManagerForm.getValueInputIdProtein('first'),
            'second': ManagerForm.getValueInputIdProtein('second')
        };
        const gr = {
            'first': ManagerForm.getValueSelectedGroupProtein('first'),
            'second': ManagerForm.getValueSelectedGroupProtein('second'),
        };

        if (element !== 'first' && element !== 'second') {
            return `Compared Sequence Structure ${idStructure['first']}:${gr['first']} and ${idStructure['second']}:${gr['second']} (${fun})`;
        }
        return `${idStructure[element]}:${gr[element]} (${fun})`;
    }

    static generateYAxesTitle() {
        const fun = ManagerForm.getValueSelectedFunction();
        return `${fun}`;
    }

    static generateXAxesTitle(element) {
        const idStructure = {
            'first': ManagerForm.getValueInputIdProtein('first'),
            'second': ManagerForm.getValueInputIdProtein('second')
        };
        const gr = {
            'first': ManagerForm.getValueSelectedGroupProtein('first'),
            'second': ManagerForm.getValueSelectedGroupProtein('second'),
        };
        return `id window(${idStructure[element]}:${gr[element]})`;
    }

    static generateBalloonText() {
        const fun = ManagerForm.getValueSelectedFunction();
        let contains = '';
        switch (fun) {
            case 'Similar' :
                contains = '';
                break;
            case 'Atom' :
                contains = 'contains [[value]] atoms';
                break;
            case 'Polar' :
                contains = 'has [[value]] polar atoms';
                break;
            case 'Rotate' :
                contains = 'with rotate bounds [[value]]';
                break;
            case 'Hydro' :
                contains = 'with hydrophobicity value: [[value]]';
                break;
        }
        return `id sequence: [[x]]([[aa]]),<br/>${contains}`;
    }
}