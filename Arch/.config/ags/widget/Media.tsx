import { bind } from 'astal';
import Mpris from 'gi://AstalMpris';

export default function Media() {
	const mpris = Mpris.get_default();

	return (
		<box className='Media'>
			{bind(mpris, 'players').as((ps) => {
				// Blank label to avoid rendering undefined
				if (ps.length === 0) return <label label='' />;

				return (
					<label
						label={bind(ps[0], 'title').as(() => {
							if (ps[0].title.endsWith(' - Twitch')) return ps[0].title.replace('-', '•');
							return `${ps[0].title} • ${ps[0].artist}`;
						})}
					/>
				);
			})}
		</box>
	);
}
