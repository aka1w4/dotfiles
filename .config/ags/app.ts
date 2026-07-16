import app from "ags/gtk4/app"
import style from "./style.scss"
import { powerprofileV, setPowerprofileV, } from "./state"

import powerprofile from "./widget/powerprofile"
import dasboard from "./widget/dashboard"
import menuwaybar from "./widget/menu_waybar"
//import windowtest from "./widget/windowtest"
//import Bar from "./widget/Bar"

app.start({
  css: style,
  main() {
    //app.get_monitors().map(Bar)
    //Bar()
    menuwaybar()
    dasboard(setPowerprofileV, powerprofileV)
    powerprofile(setPowerprofileV, powerprofileV)
    //windowtest()
  },
})
