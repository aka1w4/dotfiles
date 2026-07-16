import app from "ags/gtk4/app"
import { Gtk, Astal, Gdk } from "ags/gtk4"
import PowerProfiles from "gi://AstalPowerProfiles?version=0.1"

export default function windowBar() {
  let actived: boolean = true

  const power = PowerProfiles.get_default()
  power.get_profiles().map((p) => (print(p.profile.toString())))
  print(power.get_icon_name())

  return (
    <window visible name="testwin" keymode={Astal.Keymode.ON_DEMAND} class="Bar" application={app}>
      <Gtk.EventControllerKey
        onKeyPressed={
          ({ widget }, keyval: number) => {
            if (keyval === Gdk.KEY_Escape) {
              if (widget != undefined) {
                widget.hide()
              }
            }
          }
        }
      />
      <Gtk.GestureClick
        onPressed={({ widget, button }) => {
          if (button == Gdk.BUTTON_PRIMARY) {
            if (widget != undefined) {
              widget.hide()
            }
          }
        }} />
      <box>
        <button onClicked={() => print(actived)}>
          Hello world
        </button>
        <label
          label="<span>Click the button</span>"
          useMarkup
          wrap
        />
        <menubutton>
          button content
          <popover>popover content</popover>
        </menubutton>
        <togglebutton active={actived} onToggled={({ active }) => actived = active} />
        <switch active={actived} onNotifyActive={({ active }) => actived = active} />
        <slider
          value={0.5}
          min={0}
          max={100}
          onChangeValue={({ value }) => print(value)}
        />
        <image iconName={power.iconName} pixelSize={16} />
      </box>

    </window>
  )
}
