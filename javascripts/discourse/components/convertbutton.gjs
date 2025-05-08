import Component from "@glimmer/component";
import { action } from "@ember/object";
import DButton from "discourse/components/d-button";

export default class ConvertButton extends Component {
  @action
  converthtmltopdf() {
    function addScript(url) {
      var script = document.createElement('script');
      script.type = 'application/javascript';
      script.src = url;
      document.head.appendChild(script);
    }
    addScript('https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js');
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
