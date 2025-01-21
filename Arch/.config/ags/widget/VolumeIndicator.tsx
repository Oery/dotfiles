import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import Wp from 'gi://AstalWp';

export default function VolumeIndicator() {
	const speaker = Wp.get_default()?.audio.defaultSpeaker!;

	return (
		<window
			visible={bind(speaker, 'volume').as(Boolean)}
			className={'VolumeIndicator'}
			widthRequest={200}
			heightRequest={200}
		>
			<box valign={Gtk.Align.CENTER} halign={Gtk.Align.CENTER} vertical>
				<icon icon={bind(speaker, 'volumeIcon')} />
				<label label={bind(speaker, 'volume').as((v) => (v * 100).toFixed().toString())} />
			</box>
		</window>
	);
}
