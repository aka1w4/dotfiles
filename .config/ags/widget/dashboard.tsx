import { Gtk, Astal } from "ags/gtk4"
import { Setter, Accessor } from "ags"
import app from "ags/gtk4/app"

export default function dasboard(setVisible: Setter<boolean>, visibled: Accessor<boolean>) {


  const { TOP, RIGHT } = Astal.WindowAnchor
  return (
    <window layer={Astal.Layer.TOP} anchor={TOP | RIGHT} application={app} name="dasboard" defaultWidth={680} defaultHeight={460}>
      <box spacing={10} orientation={Gtk.Orientation.VERTICAL}>
        <button sensitive={visibled(v => !v)}
          onClicked={() => {
            print("before:", visibled.peek())
            setVisible(true)
            print("after:", visibled.peek())
          }}        >
          <label label="powerprofile" />
        </button>
      </box>
    </window>
  )
}
