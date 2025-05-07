import { apiInitializer } from "discourse/lib/api";
import ConvertButton from "../components/convertbutton";

export default apiInitializer((api) => {
  api.renderInOutlet("after-topic-footer-main-buttons", ConvertButton);
});
