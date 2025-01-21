import { App, Astal } from 'astal/gtk3';

function hide() {
	App.get_window('control-center')!.hide();
}

export default function ControlCenter() {
	return (
		<window
			visible={false}
			name='control-center'
			application={App}
			anchor={
				Astal.WindowAnchor.TOP |
				Astal.WindowAnchor.BOTTOM |
				Astal.WindowAnchor.RIGHT |
				Astal.WindowAnchor.LEFT
			}
			exclusivity={Astal.Exclusivity.IGNORE}
		>
			<eventbox onClick={hide}>
				<box>
					<label label='Control Center' />
				</box>
			</eventbox>
		</window>
	);
}
