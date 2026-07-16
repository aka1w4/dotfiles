import app from "ags/gtk4/app"
import { Astal, Gtk } from "ags/gtk4"
import { subprocess } from "ags/process"

export default function menuwaybar() {
  const label: string[] = ["waybar1", "waybar2", "waybar3"]

  return (
    <window application={app} name="menuwaybar" layer={Astal.Layer.TOP} defaultWidth={200}
      defaultHeight={100}>
      <box marginTop={20} marginEnd={20} margin_start={20} marginBottom={20} spacing={10} orientation={Gtk.Orientation.VERTICAL}>
        {label.map((w) => (
          <button onClicked={() => {
            app.get_window("menuwaybar")?.set_visible(false)
            subprocess(["./scripts/menu_waybar.sh", w])
          }}>
            <label label={w} />
          </button>
        ))}
        <button onClicked={() => {
          app.get_window("menuwaybar")?.set_visible(false)
        }}><label label="close" /></button>
      </box>
    </window >
  )
}
