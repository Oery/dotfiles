import Tray from 'gi://AstalTray';
import { App, Gtk, Gdk, astalify } from 'astal/gtk3';
import { bind } from 'astal';
import { MenuButton } from 'astal/gtk3/widget';

export default function SysTray() {
	const tray = Tray.get_default();

	return (
		<box className='systray' halign={Gtk.Align.CENTER}>
			{/* {bind(tray, 'items').as((items) =>
				items.map((item) => {
					if (item.iconThemePath) App.add_icons(item.iconThemePath);

					const menu = item.create_menu();

					return (
						<button
							tooltipMarkup={bind(item, 'tooltipMarkup')}
							onDestroy={() => menu?.destroy()}
							onClickRelease={(self) => {
								menu?.popup_at_widget(self, Gdk.Gravity.SOUTH, Gdk.Gravity.NORTH, null);
							}}
						>
							<icon gIcon={bind(item, 'gicon')} />
						</button>
					);
				})
			)} */}

			{bind(tray, 'items').as((items) =>
				items.map((item) => (
					<MenuButton
						tooltipMarkup={bind(item, 'tooltipMarkup')}
						usePopover={false}
						actionGroup={bind(item, 'action-group').as((ag) => ['dbusmenu', ag])}
						menuModel={bind(item, 'menu-model')}
					>
						<icon gIcon={bind(item, 'gicon')} />
					</MenuButton>
				))
			)}
		</box>
	);
}
