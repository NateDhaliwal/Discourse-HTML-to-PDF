import Component from "@glimmer/component";
import { action } from "@ember/object";
import DButton from "discourse/components/d-button";

export default class ConvertButton extends Component {
  @action
  converthtmltopdf() {
    var scriptN = document.createElement('script');
    scriptN.type = 'application/javascript';
    scriptN.src = "https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js";
    document.head.appendChild(scriptN);
    // ---------------------------------
    scriptN.onload = function() {
      let elementToPrint = document.getElementById("main-outlet");
      const opt = {
        margin: 10,
        filename: 'myfile.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
      };

      // Choose the element and options
      html2pdf().from(element).set(opt).save();
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
