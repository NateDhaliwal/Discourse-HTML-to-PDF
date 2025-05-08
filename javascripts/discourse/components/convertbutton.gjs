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
      html2pdf(elementToPrint);
    };
  }

  <template>
    <DButton
      class="btn btn-text"
      @icon="arrow-right-arrow-left"
      @action={{this.converthtmltopdf}}
    />
  </template>
}
