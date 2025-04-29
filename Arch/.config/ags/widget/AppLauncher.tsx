import Apps from 'gi://AstalApps';
import { App, Astal, Gdk, Gtk } from 'astal/gtk3';
import { Variable } from 'astal';

// TODO: Emoji Picker
// TODO: Accent Picker

const MAX_ITEMS = 8;

function hide() {
	App.get_window('Launcher')!.hide();
}

function handleKeyPress(self: Gtk.Widget, event: Gdk.Event, text: Variable<string>) {
	// if escape is pressed, hide the window
	if (event.get_keyval()[1] === Gdk.KEY_Escape) {
		self.hide();
		return;
	}

	// if key is backspace, remove the last character
	if (event.get_keyval()[1] === Gdk.KEY_BackSpace) {
		text.set(text.get().slice(0, -1));
		return;
	}

	// if key is alphanumeric, add it to the search
	if (event.get_keyval()[1].toLocaleString().length === 1) {
		const char = String.fromCharCode(event.get_keyval()[1]);
		text.set(text.get() + char);
		return;
	}

	console.log(event.get_keyval()[1]);
	console.log(String.fromCharCode(event.get_keyval()[1]));
}

function AppButton({ app }: { app: Apps.Application }) {
	return (
		<button
			className='App'
			onClicked={() => {
				hide();
				app.launch();
			}}
		>
			<box>
				<icon icon={app.iconName} valign={Gtk.Align.START} />
				<box valign={Gtk.Align.CENTER} vertical>
					<label className='name' truncate xalign={0} label={app.name} />
					{app.description && (
						<label className='description' wrap xalign={0} label={app.description} />
					)}
				</box>
			</box>
		</button>
	);
}

export default function Applauncher() {
	const { CENTER } = Gtk.Align;
	let apps = new Apps.Apps({
		showHidden: false,
	});

	const text = Variable('');

	const list = text((text) => apps.fuzzy_query(text).slice(0, MAX_ITEMS));
	const onEnter = () => {
		apps.fuzzy_query(text.get())?.[0].launch();
		hide();
	};

	return (
		<window
			visible={false}
			name='Launcher'
			className='Launcher'
			anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM}
			exclusivity={Astal.Exclusivity.IGNORE}
			keymode={Astal.Keymode.ON_DEMAND}
			application={App}
			onShow={() => {
				text.set('');
				apps = new Apps.Apps({
					showHidden: false,
				});
			}}
			onKeyPressEvent={(self, event) => {
				// if escape is pressed, hide the window
				if (event.get_keyval()[1] === Gdk.KEY_Escape) {
					self.hide();
					return;
				}

				// if key is backspace, remove the last character
				if (event.get_keyval()[1] === Gdk.KEY_BackSpace) {
					text.set(text.get().slice(0, -1));
					return;
				}

				// if key is not symbols, add it to the search
				if (event.get_keyval()[1] < 150) {
					const char = String.fromCharCode(event.get_keyval()[1]);
					text.set(text.get() + char);
					return;
				}
			}}
		>
			<box>
				<eventbox widthRequest={4000} expand onClick={hide} />
				<box hexpand={false} vertical>
					<eventbox heightRequest={100} onClick={hide} />
					<box widthRequest={500} className='Applauncher' vertical>
						<entry
							name={'search'}
							className={'search'}
							placeholderText='Search'
							text={text()}
							onChanged={(self) => text.set(self.text)}
							onActivate={onEnter}
							canFocus={false}
						/>
						<box spacing={6} vertical className={'AppList'}>
							{list.as((list) => list.map((app) => <AppButton app={app} />))}
						</box>
						<box
							halign={CENTER}
							className='not-found'
							vertical
							visible={list.as((l) => l.length === 0)}
						>
							<icon icon='system-search-symbolic' />
							<label label='No match found' />
						</box>
					</box>
					<eventbox expand onClick={hide} />
				</box>
				<eventbox widthRequest={4000} expand onClick={hide} />
			</box>
		</window>
	);
}
