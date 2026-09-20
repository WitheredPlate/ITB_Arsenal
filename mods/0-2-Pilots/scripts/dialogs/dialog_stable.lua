--////////////////////////////////--
--//         Background         //--
--////////////////////////////////--

--## Name: Finn Smith
--## Sex: Male
--## Race: Human
--## Age: 46
--## Job: Personal Bodyguard
--## Sponsor: Harmony Reclamation

--## Finn Smith is a professional personal bodyguard.
--## He is extremely well-trained in a wide variety of hand-to-hand combat styles in addition to a less extensive but still impressive reportoire of conventional weapon and firearm expertise.
--## Finn was hired by Harmony Reclamation pre-emergence to guard Irene Powell against raider incursions.
--## After the emergence and the subsequent fleeing en-masse of the raiders, Irene was happy to have him sent to Mech aptitude assessments.
--## His experience with hand-to-hand combat translated excellently to Mech vs Vek combat, especially with Prime-Class Mechs.

--////////////////////////////////--





--////////////////////////////////--
--//          Character         //--
--////////////////////////////////--

--## Finn Smith, the vast majority of the time, is serious and views the situation at hand for what it is, a serious conflict with hundreds of lives at stake.
--## However, occasionally when he has what he sees as a golden opportunity to do so, Finn will attempt to make humorous remarks. His jokes are best described as "dad jokes" and are almost always focused on low-quality puns.
--## He is extremely mission-oriented and utilitarianistic, and is willing to sacrifice lives to obtain an advantage he knows will allow him to or increase his chances of saving more lives later.
--## Finn has a problematically large ego, and believes himself capable of accomplishing almost anything he sets his mind to. However, this is a clinically-diagnosed issue that he is fully aware of. Whenever something goes wrong that is realistically his fault, his first instinct is to blame others. Though he typically supresses this urge, he never makes a full circle to place the blame on himself, rather blaming nobody but becoming increasingly frusturated.
--## Despite his ego, he will say "we" instead of "I" whenever it makes grammatical and logical sense to do so, crediting the whole team with any accomplishments. He is also quick to point out and affirm the virtues of others.
--## Consistently refers to all others exclusively by first name.

--////////////////////////////////--





--////////////////////////////////--
--//            Lines           //--
--////////////////////////////////--

return {

----------------
-- Game Start --
----------------

	Gamestart = {
		"Attention, all islands - your cavalry has arrived. Hold on just a little longer, we're going to get you all through this in one piece.",
		"#squad, I'm here because I was bound by contract to help. But even if I wasn't, I'd be helping the same anyways. We're the saviors of humanity. We best damn act like it.",
		"Reporting in. #squad, our path to victory is clear. Preventing these islands from falling guarantees us winning this war.",
		"We're here. These islands won't fall again - this time we win."
	},
	Gamestart_PostVictory = {
		"We're back. The islands will be reinforced and the Vek will be exterminated. We've done it before, we can do it again.",
		"Commander, I'm here from another timeline that I guided to winning the war. Let me take point and I can do the same for this timeline.",
		"At this point \"saviors of humanity\" doesn't do us justice. We save entire timelines, and I don't doubt we'll add this one to that count."
	},


----------------------
-- Combat (General) --
----------------------

	VekKilled_Self = {
		"One down.",
		"Stay down.",
		"Vek's dead.",
		"This one's dead!"
	},
	VekKilled_Obs = {
		"Nice kill, #main_first.",
		"That Vek sure won't be getting up.",
		"Excellent kill, #main_first. Keep that up.",
		"Make sure it stays dead, #main_first."
	},
	VekKilled_Vek = {
		"Nice. They're turning on each other.",
		"The Vek are clearing each other out.",
		"I guess you could say... That Vek wanted that guy e-Vek-ted."
	},
	DoubleVekKill_Self = {
		"Keep em comin'.",
		"Two down.",
		"These two sure as hell won't be getting back up."
	},
	DoubleVekKill_Obs = {
		"Nice kills, #main_first!",
		"I have to take you out for a drink after this, #main_first.",
		"Amazing. You'll have to show me how you did that."
	},
	DoubleVekKill_Vek = {
		"That Vek is cleaning house for us.",
		"Good shit. Turn them against each other and they'll do half our work for us."
	},
	Emerge_Detected = {
		"More Vek spotted on sensors.",
		"They're digging up from below!",
		"Topside's about to be a lot more crowded."
	},
	Emerge_Success = {
		"They're up. I guess we just have to put them back in the ground.",
		"The Vek are up. Not for long, if I have anything to say on it.",
		"More Vek - keep the pressure on 'em!"
	},
	Emerge_FailedMech = {
		"This one's pinned.",
		"Not a chance, Vek.",
		"This Vek's not surfacing on my watch.",
		"I'm keeping this one down."
	},
	Emerge_FailedVek = {
		"The Vek are getting in each other's way.",
		"Too crowded for them, I guess."
	},
	BotKilled_Self = {
		"Had to break one of the bots, commander.",
		"I hope Zenith doesn't get too pissed at me for that.",
		"The bot was causing problems, unfortunately"
	},
	BotKilled_Obs = {
		"I trust you had a good reason for killing that bot, #main_first.",
		"I trust your judgement on destroying that robot, #main_first.",
		"Killing that bot wasn't great, but hopefully it shouldn't have more consequences."
	},
	Mech_LowHealth = {
		"I'm just getting started, Vek.",
		"Hull's low, but I can keep fighting!",
		"#self_mech is running on fumes here!",
		"I'm almost down, but if these Vek think they can take me there, they've got another thing coming."
	},
	Death_Main = {
		"Mech's failing... Win this war, #squad.",
		"...Sure as hell isn't how I wanted to go, but at least I went out fighting.",
		"...Remember me, #squad."
	},
	Death_Response = {
		"#main_first's down! Keep fighting, try to get to #main_mech if you can!",
		"I'll remember you, #main_first.",
		"Damnnit!... #main_first's down."
	},
	Death_Response_AI = {
		"#main_mech's down. Keep fighting, try to get to it if you can.",
		"Mech down. We can recover it after the battle."
	},
	Death_Revived = {
		"And you thought I was down for good.",
		"Round 2, assholes.",
		"Vek? You might as well start running."
	},


------------------------
-- Combat (Elemental) --
------------------------

	Vek_Drown = {
		"And straight to the bottom.",
		"Drowned. Keep watch for fliers.",
		"Nice. The Vek aren't great swimmers."
	},
	Vek_Fall = {
		"It's a long way down.",
		"That fall should be lethal to that Vek.",
		"One down. Literally."
	},
	Vek_Smoke = {
		"It looks like that Vek's blinded.",
		"I can barely see that Vek on sensors, I doubt it can see us.",
		"That Vek's been stunned by the smoke."
	},
	Vek_Frozen = {
		"Vek's frozen solid.",
		"It looks like that Vek's immobilized by the ice.",
		"We call that one... a Veksicle."
	},
	Mech_Webbed = {
		"Ugh. This Vek's got me webbed up.",
		"You might have bitten off more than you can chew here, Vek.",
		"This Vek's got me pinned. I'll be out and it'll be dead, the only question is how soon.",
		"I'm getting tired of this webbing."
	},
	Mech_Shielded = {
		"Shield going up.",
		"Doubt I'll need the shield, but no point in complaining.",
		"No harm in a little extra protection."
	},
	Mech_ShieldDown = {
		"Shield's popped.",
		"I lost the shield.",
		"Shield took the hit.",
		"I guess I did need the shield."
	},
	Mech_Repaired = {
		"Up and at 'em, #self_mech. We've got work to do.",
		"Not the best use of my time, but the hull's in better shape now.",
		"Feels unnecessary, commander, but repairs are complete."
	},


--------------------
-- Combat (Level) --
--------------------

	Pilot_Level_Self = {
		"Never been a fan of military ranks, but at least my skill is being recognized.",
		"I'm freelance by trade, but if you insist I'll take the promotion.",
		"I don't need the medal - just remember me."
	},
	Pilot_Level_Obs = {
		"Good shit, #main_first. About time they started recognizing your skill.",
		"I love to see it, #main_first. You deserve every bit of praise."
	},


--------------------------
-- Combat (Environment) --
--------------------------

	MntDestroyed_Self = {
		"That mountain and I had some... rocky relations.",
		"Mountain's cleared.",
		"Opened up some more maneuvering space."
	},
	MntDestroyed_Obs = {
		"Mountain's cleared.",
		"Thanks for the maneuvering space, #main_first."
	},
	MntDestroyed_Vek = {
		"Vek cleared the mountain.",
		"Better than nothing. Gives us some room to maneuver."
	},
	Bldg_Destroyed_Self = {
		"...Damnnit. I thought that building would hold.",
		"...Shit. This weapon needs to be tuned tighter.",
		"...Damn. The Vek gave me no choice, that was the only way."
	},
	Bldg_Destroyed_Obs = {
		"...I trust your judgement, #main_first.",
		"I can't say I approve, #main_first, but I have faith that was your best option.",
		"Keep your head in the game, #main_first. It's a loss, but tiny compared to the rest of the lives on the line."
	},
	Bldg_Destroyed_Vek = {
		"You just signed your death warrant, Vek.",
		"That's not going to happen without consequences, Vek. If I were you, I'd start running.",
		"The building's down. I don't think anyone survived.",
		"Nobody else touch that Vek. It just made things personal."
	},
	Bldg_Resisted = {
		"Lucky. #corp's construction held.",
		"Someone give an award to the architects, the construction workers, or both.",
		"Nice. Somehow, no casualties from that hit.",
		"The building survived!"
	},
	PowerCritical = {
		"We're on thin ice here. I know we can pull through, but maybe start prioritizing the Grid, #squad.",
		"The Grid's not looking good!",
		"Focus on the Grid, #squad. It's barely holding on."
	},
	Gameover_Start = {
		"Damn... Grid just hit zero.",
		"I think... I think we lost. I'm getting reports of Vek swarming the island."
	},
	Gameover_Response = {
		"I thought... I guess we try again - open a breach.",
		"I hate it... but we have to leave. Starting breach protocols."
	},


-------------------
-- Mech Upgrades --
-------------------

	Upgrade_PowerWeapon = {
		"Weapon's online.",
		"What do you have for me this time, commander?",
		"I love to see it.",
		"Already got ideas on how to use it.",
		"You might even say I'm... gunning for victory."
	},
	Upgrade_NoWeapon = {
		"Are you expecting me to fight barehanded? Just say the word.",
		"No weapons? Challenge accepted.",
		"Commander, I can't fight without... screw it. I've got this."
	},
	Upgrade_PowerGeneric = {
		"I'll take it.",
		"Just listen to that hum.",
		"I appreciate it, commander.",
		"Ready to rumble."
	},


-----------------------
-- Mission (General) --
-----------------------

	MissionStart = {
		"",
		"",
		""
	},
	Mission_ResetTurn = {
		"",
		"",
		""
	},
	MissionEnd_Retreat = {
		"",
		""
	},
	MissionEnd_Dead = {
		"",
		"",
		""
	},
	PodIncoming = {
		"",
		""
	},
	PodResponse = {
		"",
		""
	},
	PodCollected_Self = {
		"",
		""
	},
	PodDestroyed_Obs = {
		"",
		""
	},
	Secret_DeviceSeen_Mountain = {
		""
	},
	Secret_DeviceSeen_Ice = {
		""
	},
	Secret_DeviceUsed = {
		""
	},
	Secret_Arriving = {
		""
	},
	FTL_Found = {
		""
	},
	Mission_Train_TrainStopped = {
		"",
		""
	},
	Mission_Train_TrainDestroyed = {
		"",
		""
	},
	Mission_Block_Reminder = {
		"",
		""
	},


-----------------------
-- Mission (Archive) --
-----------------------

	Mission_Airstrike_Incoming = {
		"",
		""
	},
	Mission_Repair_Start = {
		""
	},
	Mission_Tanks_Activated = {
		"",
		""
	},
	Mission_Tanks_PartialActivated = {
		"",
		""
	},
	Mission_Dam_Reminder = {
		"",
		""
	},
	Mission_Dam_Destroyed = {
		"",
		""
	},
	Mission_Satellite_Destroyed = {
		"",
		""
	},
	Mission_Satellite_Imminent = {
		"",
		""
	},
	Mission_Satellite_Launch = {
		"",
		""
	},
	Mission_Mines_Vek = {
		"",
		""
	},


-------------------
-- Mission (RST) --
-------------------

	Mission_Terraform_Destroyed = {
		"",
		""
	},
	Mission_Terraform_Attacks = {
		"",
		""
	},
	Mission_Cataclysm_Falling = {
		"",
		""
	},
	Mission_Lightning_Strike_Vek = {
		"",
		""
	},
	Mission_Solar_Destroyed = {
		"",
		""
	},
	Mission_Force_Reminder = {
		"",
		""
	},
	Mission_Wind_Mech = {
		"",
		""
	},


------------------------
-- Mission (Pinnacle) --
------------------------

	Mission_Freeze_Mines_Vek = {
		"",
		""
	},
	Mission_Factory_Destroyed = {
		"",
		""
	},
	Mission_Factory_Spawning = {
		"",
		""
	},
	Mission_Reactivation_Thawed = {
		"",
		""
	},
	Mission_Hacking_NewFriend = {
		"",
		""
	},
	Mission_Shields_Down = {
		"",
		""
	},
	Mission_SnowStorm_FrozenVek = {
		"",
		""
	},
	Mission_SnowStorm_FrozenMech = {
		"",
		""
	},


------------------------
-- Mission (Detritus) --
------------------------

	Mission_Disposal_Destroyed = {
		"",
		""
	},
	Mission_Disposal_Activated = {
		"",
		""
	},
	Mission_ACID_Storm_Start = {
		"",
		""
	},
	Mission_ACID_Storm_Clear = {
		"",
		""
	},
	Mission_Barrels_Destroyed = {
		"",
		""
	},
	Mission_Power_Destroyed = {
		"",
		""
	},
	Mission_Teleporter_Mech = {
		""
	},
	Mission_Belt_Mech = {
		""
	},


--------------------
-- Mission (Hive) --
--------------------

	MissionFinal_Start = {
		"",
		""
	},
	MissionFinal_StartResponse = {
		""
	},
	MissionFinal_FallResponse = {
		""
	},
	MissionFinal_Bomb = {
		""
	},
	MissionFinal_CaveStart = {
		""
	},
	MissionFinal_BombArmed = {
		""
	},
	TimeTravel_Win = {
		"",
		""
	},


------------
-- Impact --
------------

	Mech_Heal = {
		"Hull's coming back.",
		"That should withstand another hit.",
		"Hull breaches sealing."
	},
	Mech_Boost = {
		"Reactor outputting at 132% and rising. This'll be fun.",
		"I'm getting a massive weaponry output spike here.",
		"The Vek better watch out.",
		"Weaponry output beyond safe thresholds and still rising. You love to see it."
	},
	Mech_Supply = {
		"Ammunition, fresh off the grill.",
		"Cycling to new ammo.",
		"It's too bad I can't do a fancy reload in this thing."
	},
	Mech_Deplete = {
		"I got nothin' left.",
		"Weaponry ammo reserves just bottomed out."
	},
	Mech_SelfDamage = {
		"This thing kicks like a mule - and I am loving every second of it.",
		"A wild ride; just my typa' weapon.",
		"Dishing out extra carnage at the cost of hull failure? Sounds like a good deal to me."
	},


-------------
-- Arsenal --
-------------

	Mech_Push = {
		"",
		"",
		"",
		""
	},
	Mech_Shove = {
		"",
		""
	},
	Mech_Flip = {
		"",
		"",
		""
	},
	Mech_Accelerate = {
		"",
		""
	},
	Mech_Overclock = {
		"",
		""
	}
}

--////////////////////////////////--
