import Component from "@glimmer/component";
import { action } from "@ember/object";
import DButton from "discourse/components/d-button";

export default class ConvertButton extends Component {
  @action
  converthtmltopdf() {
    var scriptN = document.createElement('script');
    //scriptN.type = 'application/javascript';
    scriptN.src = "https://unpkg.com/jspdf@latest/dist/jspdf.umd.min.js" /*"https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"*/;
    document.head.appendChild(scriptN);
    // ---------------------------------
    scriptN.onload = function() {
      /*
      let elementToPrint = document.getElementById("main-outlet");
      html2pdf(elementToPrint);
      */

      var doc = new jsPDF();          
      var elementHandler = {
        '#d-sidebar': function (element, renderer) {
          return true;
        }
      };
      var source = window.document.getElementById("main-outlet")[0];
      doc.fromHTML(
          source,
          15,
          15,
          {
            'width': 180,'elementHandlers': elementHandler
          });
      
      doc.output("dataurlnewwindow");
    };
  }

  <template>
    <DButton
      class="btn icon btn-flat"
      @icon="arrow-right-arrow-left"
      @action={{this.converthtmltopdf}}
    />
  </template>
}
