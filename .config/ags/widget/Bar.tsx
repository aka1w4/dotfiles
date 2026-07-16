import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Niri from "gi://AstalNiri"
import AstalPowerProfiles from "gi://AstalPowerProfiles?version=0.1"

export default function Bar() {
  const time = createPoll("", 1000, "date")

  // Mengambil data real-time dari Niri
  const niri = Niri.get_default()

  AstalPowerProfiles.get_default()
  return (
    <window
      visible
      name="bar"
      class="Bar"
      // gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      //   anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        <button
          $type="start"
          onClicked={() => execAsync("echo hello").then(console.log)}
          hexpand
          halign={Gtk.Align.CENTER}
        >
          <label label="Welcome to AGS!" />
        </button>
        <box $type="center" />
        <menubutton $type="end" hexpand halign={Gtk.Align.CENTER}>
          <label label={time} />
          <popover>
            <Gtk.Calendar />
          </popover>
        </menubutton>
      </centerbox>
    </window>
  )
}
