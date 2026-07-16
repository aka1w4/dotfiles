import app from "ags/gtk4/app"
import AstalPowerProfiles from "gi://AstalPowerProfiles?version=0.1"
import { Accessor, Setter } from "ags"
import { Astal, Gtk } from "ags/gtk4"

export default function powerprofile(setVisible: Setter<boolean>, visibled: Accessor<boolean>) {
  const power = AstalPowerProfiles.get_default()
  const list = power.get_profiles()

  const { TOP, RIGHT } = Astal.WindowAnchor

  return (
    <window layer={Astal.Layer.TOP} defaultWidth={860}
      defaultHeight={100} marginStart={580} marginTop={100} application={app} name="powerprofile" anchor={TOP | RIGHT} visible={visibled}>
      <box spacing={10} marginTop={20} marginEnd={20} margin_start={20} marginBottom={20} orientation={Gtk.Orientation.VERTICAL}>
        {list.map((p) => (
          <button
            onClicked={() => {
              //power.set_active_profile(p.profile)
              setVisible(false)
              print("telah jalan")
            }}
          >
            <label label={p.profile} />
          </button>
        ))}
        <button
          onClicked={() => {
            //power.set_active_profile(p.profile)
            setVisible(false)
            print("telah jalan")
          }}
        >
          <label label="Close" />
        </button>
      </box>
    </window >
  )
}
