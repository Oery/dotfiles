import { App } from 'astal/gtk3';
import style from './scss/style.scss';
import Bar from './widget/Bar';
import Applauncher from './widget/AppLauncher';
import ControlCenter from './widget/control-center/ControlCenter';

App.start({
	css: style,
	main() {
		App.get_monitors().map(Bar);
		Applauncher();
		ControlCenter();
	},
});
