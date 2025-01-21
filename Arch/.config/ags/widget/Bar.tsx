import { App, Astal, Gtk, type Gdk } from 'astal/gtk3';

import Workspaces from './Workspaces';
import Media from './Media';
import SysTray from './SysTray';
import Wifi from './Wifi';
import FocusedClient from './FocusedClient';
import Time from './Time';
import MicMute from './MicMute';

export default function Bar(gdkmonitor: Gdk.Monitor) {
	return (
		<window
			name='Bar'
			className='Bar'
			gdkmonitor={gdkmonitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
			application={App}
			heightRequest={40}
		>
			<centerbox>
				<Workspaces />

				<Time format='%a %e.%m' />

				<box valign={Gtk.Align.CENTER} halign={Gtk.Align.END}>
					<SysTray />
					{/* <Wifi /> */}
					<MicMute />
					<Time format='%H:%M' />
				</box>
			</centerbox>
		</window>
	);
}
