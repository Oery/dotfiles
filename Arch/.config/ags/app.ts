import { App, type Gdk, type Gtk } from 'astal/gtk3';
import style from './scss/style.scss';
import Bar from './widget/Bar';
import Applauncher from './widget/AppLauncher';
import ControlCenter from './widget/control-center/ControlCenter';
import { exec } from 'astal/process';

function main() {
	const bars = new Map<Gdk.Monitor, Gtk.Widget>();

	for (const gdkmonitor of App.get_monitors()) {
		bars.set(gdkmonitor, Bar(gdkmonitor));
	}

	App.connect('monitor-added', (_, gdkmonitor) => {
		bars.set(gdkmonitor, Bar(gdkmonitor));
	});

	App.connect('monitor-removed', (_, gdkmonitor) => {
		bars.get(gdkmonitor)?.destroy();
		bars.delete(gdkmonitor);
	});

	Applauncher();
	ControlCenter();
}

App.start({
	css: style,
	main,
	requestHandler(request: string, res: (response: string) => void) {
		if (request === 'reload_styles') {
			App.reset_css();

			exec('sass ./scss/style.scss /tmp/style.css');
			App.apply_css('/tmp/style.css');
			return res('reloaded styles!');
		}
		res('unknown command');
	},
});
