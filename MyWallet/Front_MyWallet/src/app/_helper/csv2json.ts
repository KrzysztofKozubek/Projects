import {Injectable} from '@angular/core';

@Injectable({providedIn: 'root'})
export class Csv2json {

  constructor() {
  }

  CSVToArray(csvData: string, delimiter: string = ';') {
    delimiter = (delimiter || ",");
    var objPattern = new RegExp((
      "(\\" + delimiter + "|\\r?\\n|\\r|^)" +
      "(?:\"([^\"]*(?:\"\"[^\"]*)*)\"|" +
      "([^\"\\" + delimiter + "\\r\\n]*))"), "gi");
    var arrData: string[][] = [[]];
    var arrMatches = null;
    while (arrMatches = objPattern.exec(csvData)) {
      var strMatchedDelimiter = arrMatches[1];
      if (strMatchedDelimiter.length && (strMatchedDelimiter != delimiter)) {
        arrData.push([]);
      }
      var strMatchedValue: string = '';
      if (arrMatches[2]) {
        strMatchedValue = arrMatches[2].replace(
          new RegExp("\"\"", "g"), "\"");
      } else {
        strMatchedValue = arrMatches[3];
      }
      arrData[arrData.length - 1].push(strMatchedValue);
    }
    return (arrData);
  }

  CSV2JSON(csv: string, delimiter: string = ';'): object[] {
    var array: string[][] = this.CSVToArray(csv, delimiter);
    var objArray: any[] = [];
    for (let i = 1; i < array.length; i++) {
      objArray[i - 1] = {};
      for (let k = 0; k < array[0].length && k < array[i].length; k++) {
        let key = array[0][k];
        objArray[i - 1][key] = array[i][k];
      }
    }

    return objArray;
  }
}
