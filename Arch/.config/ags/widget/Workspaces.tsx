import { bind, exec, execAsync } from 'astal';
import { Gtk } from 'astal/gtk3';
import Hyprland from 'gi://AstalHyprland';

interface UnknownWorkspace {
	id: number;
	focus: (() => void) | undefined;
}

function toJapanese(num: number) {
	const thatMap: Record<number, string> = {
		1: '一',
		2: '二',
		3: '三',
		4: '四',
		5: '五',
	};

	return thatMap[num] ?? num;
}

function toRoman(num: number) {
	const thatMap: Record<number, string> = {
		1: 'I',
		2: 'II',
		3: 'III',
		4: 'IV',
		5: 'V',
		6: 'VI',
		7: 'VII',
		8: 'VIII',
		9: 'IX',
		10: 'X',
	};

	return thatMap[num] ?? num;
}

export default function Workspaces() {
	const hypr = Hyprland.get_default();
	const workspacesIds = [1, 2, 3, 4, 5];

	function focusOrCreate(workspace: UnknownWorkspace) {
		if (workspace.focus) workspace.focus();
		else exec(`hyprctl dispatch workspace ${workspace.id}`);
	}

	return (
		<box className='workspaces'>
			{bind(hypr, 'workspaces').as((wss) => {
				const workspaces = workspacesIds.map((id) => {
					const foundWorkspace = wss.find((ws) => ws.id === id);
					return foundWorkspace || ({ id, focus: undefined } as UnknownWorkspace);
				});

				return workspaces
					.sort((a, b) => a.id - b.id)
					.map((ws) => (
						// biome-ignore lint/a11y/useButtonType: <explanation>
						// biome-ignore lint/correctness/useJsxKeyInIterable: <explanation>
						<button
							onClicked={() => focusOrCreate(ws)}
							valign={Gtk.Align.CENTER}
							className={bind(hypr, 'focusedWorkspace').as((fw) => (ws === fw ? 'focused' : ''))}
						>
							{toJapanese(ws.id)}
						</button>
					));
			})}
		</box>
	);
}
