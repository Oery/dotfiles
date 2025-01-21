import { bind } from 'astal';
import { Gtk } from 'astal/gtk3';
import Hyprland from 'gi://AstalHyprland';

export default function FocusedClient() {
	const hypr = Hyprland.get_default();
	const focused = bind(hypr, 'focusedClient');

	return (
		<box className='focused_app' vertical visible={focused.as(Boolean)} valign={Gtk.Align.CENTER}>
			{focused.as(
				(client) =>
					client && (
						<box vertical>
							{/* biome-ignore lint/a11y/noLabelWithoutControl: <explanation> */}
							<label
								className='title'
								halign={Gtk.Align.START}
								label={bind(client, 'title').as((title) => shorten(title, 50))}
							/>
						</box>
					)
			)}
		</box>
	);
}

function shorten(str: string, max: number) {
	return str.length > max ? `${str.slice(0, max)}...` : str;
}
