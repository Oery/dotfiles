import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import Wp from 'gi://AstalWp';

export default function MicMute() {
	const mic = Wp.get_default()?.audio.defaultMicrophone;
	if (!mic) return null;

	return (
		<box visible={bind(mic, 'mute').as(Boolean)} className='MicMute' halign={Gtk.Align.CENTER}>
			<icon icon={bind(mic, 'volumeIcon')} />
		</box>
	);
}
