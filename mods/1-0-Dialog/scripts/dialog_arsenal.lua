--////////////////////////////////--
--//       Arsenal Dialogs      //--
--////////////////////////////////--

-- By WitheredPlate

return {

    --------------
    -- Template --
    --------------

    Template = {
        Vek_Flip = {
            -- A Vek is subject to a Flipping or Rotating effect. --
            -- 10% Chance. --
            -- Selects a random Pilot. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        },
        Mech_Accelerate = {
            -- This Pilot's Mech is successfully Accelerated. --
            -- 30% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        },
        Mech_Overclock = {
            -- This Pilot's Mech is successfully Overclocked. --
            -- 40% Chance. --
            -- Typically has 2-3 Lines. --
            "",
            ""
        }
    },


    ----------------
    -- Artificial --
    ----------------

    Artificial = {
        Vek_Flip = {
            "Update: Vek disoriented",
            "Update: Kinetic force has manipulated Vek attack",
            "Update: Vek attack manipulated"
        },
        Mech_Accelerate = {
            "Status: Motor enhancements detected",
            "Status: Fuel injectors fully operational"
        },
        Mech_Overclock = {
            "Status: Targeting matrix online",
            "Status: Auto-cycling bay active"
        }
    },


    -----------------
    -- Corporation --
    -----------------

    Archive = {
        Vek_Flip = {
            "Seems like that one threw that Vek for a loop.",
            "That Vek's disoriented."
        },
        Mech_Accelerate = {
            "Torque readings are off the charts.",
            "I've never seen the fuel lines pumping so fast... here's hoping they don't burst.",
            "Motor output's rising... the chassis should handle it?"
        },
        Mech_Overclock = {
            "Cycling bay is running overtime.",
            "Ejection channels are cleared and lubricated. Ready for heavy output."
        }
    },

    Detritus = {
        Vek_Flip = {
            "That Vek looks unsteady. Maybe it lost its sense of balance?",
            "Excellent... That Vek's not even sure what it was just doing.",
            "I'm no expert, but I'm pretty sure that Vek doesn't even know what it's looking at anymore."
        },
        Mech_Accelerate = {
            "Drive frame instability's very high, but my mobility should be enhanced.",
            "Fuel lines pumping at 210% flow rate.",
            "Motor output's at stage 4, but I don't like the warnings I'm getting from the drive frame."
        },
        Mech_Overclock = {
            "I'm seeing a spike in augur processor activity.",
            "Targeting matrix is nearly reaching record peaks."
        }
    },

    Pinnacle = {
        Vek_Flip = {
            "[ The strike has rendered the Vek disoriented ]",
            "[ Vek staggered by kinetic force ]"
        },
        Mech_Accelerate = {
            "[ Statistically anomalous fuel injection levels read ]",
            "[ Unusual motor output detected ]"
        },
        Mech_Overclock = {
            "[ Targeting matrix stage advanced. Augur throughput holding ]",
            "[ Extreme cycling bay activity detected ]"
        }
    },

    Rust = {
        Vek_Flip = {
            "That Vek's got no idea what just hit it.",
            "Vek got turned around. Wouldn't put brain damage off the table.",
            "Vek's confused. It won't see us coming."
        },
        Mech_Accelerate = {
            "Engine running hot.",
            "Motor torque high and rising.",
            "Fuel injectors engaged. Let's see these bastards try to keep up."
        },
        Mech_Overclock = {
            "Cycling bay's reached top speed. Not a good day to be a Vek.",
            "Spotter matrix is catching targets twice as fast now.",
            "Ejection channels open to full."
        }
    },


    ------------
    -- Unique --
    ------------

    Aquatic = {
        Vek_Flip = {
            "It appears that Vek's cerebular balance has been disrupted.",
            "I suspect the impact has shaken that Veks's ability to differentiate friend and foe.",
            "The Vek has been destabilized."
        },
        Mech_Accelerate = {
            "Haste is a familiar song and dance for myself, but the sweetness does not fade with time.",
            "An ordinary machine might have difficulty handling such motoric enhancements. You'll not find me complaining.",
            "I've fostered quite the alacrity in this shell's engine.",
            "#self_mech shall be swift, as is only proper.",
            "The drive frame may complain, but it would do it best to grow used to this charade."
        },
        Mech_Overclock = {
            "I am pleased say that my cycling and ejection ports are cleared and ready for full operation.",
            "Curious. #self_mech's augur processing units are running at a capacity that rivals my own.",
            "My Mech's targeting matrix is proving its value."
        }
    },

    Arrogant = {
        Vek_Flip = {
            "How the turned tables, I suppose.",
            "Now you see me, now you don't.",
            "What was it those guys in yellow said? Face the wall?"
        },
        Mech_Accelerate = {
            "This is more like it. Let's close the gap.",
            "The world gets smaller every day.",
            "Don't you worry, Vek. I'll be there before you know it."
        },
        Mech_Overclock = {
            "I've seen this go wrong exactly once. Not pretty. Had to drive a Mech manually for a few minutes.",
            "Huh. #self_mech is spotting Vek faster than I can.",
            "Seven of my Augurs are seeing double, one's just actually dead."
        }
    },

    Assassin = {
        Vek_Flip = {
            "Without its balance, it cannot fight.",
            "It is vulnerable to blunted force. Not truly a weakness, but an advantage nonetheless."
        },
        Mech_Accelerate = {
            "The steps between us are shrinking in number, Vek.",
            "Agility is key to a complete victory.",
            "If you cannot lay hand on your foe, you cannot defeat them."
        },
        Mech_Overclock = {
            "A heavy blow pales in comparison to a deluge of fists.",
            "I have been enhanced."
        }
    },

    Caretaker = {
        Vek_Flip = {
            "Looks like you're having a lil' trouble staying upright!",
            "Round and round. Just like a ballerina!",
            "Oopsie. Looks like that Vek might take a tumble."
        },
        Mech_Accelerate = {
            "#squad, does anyone feel like a race?",
            "#self_mech's feeling the zoomies.",
            "Faster? You know #self_first can handle it!"
        },
        Mech_Overclock = {
            "#self_mech's doing such a good job!",
            "#self_first is ready to rumble!"
        }
    },

    Chemical = {
        Vek_Flip = {
            "Their sensory organs might not be well-adapted to the surface. They can't keep their bearings.",
            "That Vek can't tell up from down. The perfect time to stage an ambush.",
            "A little blunt force head trauma never hurt anyone.",
            "Pretty easy to disorient, all things considered."
        },
        Mech_Accelerate = {
            "Wow. The fuel injectors are NOT supposed to be doing that.",
            "Titan-class drive frames are theoretically built to handle this, but that doesn't make it less awesome.",
            "The way I'm seeing the motors behave is a little concerning."
        },
        Mech_Overclock = {
            "Augur network interlacing at triple capacity and holding... somehow.",
            "Half the time I forget the targeting matrix is even installed, the other half it's saving my ass.",
            "Cycling throughput rising."
        }
    },

    Delusional = {
        Vek_Flip = {
            "The chosen one perserveres through struggle. The Vek do not.",
            "Father Time's portents are not for most minds to handle."
        },
        Mech_Accelerate = {
            "Father Time's power flows through me.",
            "Time is slipping.",
            "Time flows like water."
        },
        Mech_Overclock = {
            "This power is below me... but I shall accept it nonetheless.",
            "Father Time has granted me power!"
        }
    },

    Genius = {
        Vek_Flip = {
            "Looks like that Vek's having trouble staying upright.",
            "It's lost its balance!",
            "Blunt trauma seems to be effective. We should leverage that more often."
        },
        Mech_Accelerate = {
            "The fuel line valves should hold. Should.",
            "I don't think level of drive frame stability is normal?.. I forgot the range.",
            "We should stop and think about the consequences of bypassing software limiters more often..."
        },
        Mech_Overclock = {
            "I'm not seeing any misalignments in the augurs. Yet.",
            "The ejection channels seem to be running smoothly? Fingers crossed.",
            "The targeting matrix is running at the maximum safe threshold."
        }
    },

    Hotshot = {
        Vek_Flip = {
            "The Vek wasn't expecting to get unbalanced!",
            "Vek's disoriented!",
            "That Vek's all turned around."
        },
        Mech_Accelerate = {
            "Here we go. I'm coming in hot.",
            "Let's kick things into high gear.",
            "Engine holding hot and steady. Might wanna get out of the way."
        },
        Mech_Overclock = {
            "I wish my spotters would shut up. I can see fine.",
            "Cycling bay's going ham. Get ready for a barrage, #squad.",
            "The Vek won't know what hit 'em."
        }
    },

    Leader = {
        Vek_Flip = {
            "Looks like that strike disoriented the Vek.",
            "That Vek's lost its bearings!",
            "That Vek doesn't seem to know which way to look."
        },
        Mech_Accelerate = {
            "Engine's running real hot.",
            "Clear a path and I can get there.",
            "Fuel injectors running. My mobility's looking real pretty here."
        },
        Mech_Overclock = {
            "Cycling speed rapidy rising. Should be good for a barrage.",
            "Ejection channels are routing - I'm ready to do some damage."
        }
    },

    Medic = {
        Vek_Flip = {
            "That V-Vek s-s-seems to be unbalanced.",
            "Looks l-like the f-f-force confused t-that Vek.",
            "I... I d- don't think that V-Vek even knows where we are..."
        },
        Mech_Accelerate = {
            "S-Surely the drive frame is- isn't r-rated for this?",
            "My m-motors are, uh... turning... running... w-way faster than they s-sh-should be.",
            "T-This much fir... er... flammable fuel s-so near to me is making me n-n-nervous."
        },
        Mech_Overclock = {
            "I... Wow. I-I've never seen the augurs inter... interface this f-fast.",
            "The t-t-targeting matrix is supposed to j-just be an aim assist... it s-seems like it's almost making its o-own decisions?",
            "I don't l-l-like humanizing c-components... but m-m-my a-augurs seem almost... angry?"
        }
    },

    Miner = {
        Vek_Flip = {
            "Vek has been destabilized.",
            "Blunt force tremors detected on and around Vek."
        },
        Mech_Accelerate = {
            "Mech mobility exceeds acceptable levels. No running in the worksite.",
            "Logging an improvement to traversal capabilities."
        },
        Mech_Overclock = {
            "Mech throughput increasing.",
            "Potential work output rising",
            "Energy draw of targeting matrix exceeds alloted budget."
        }
    },

    Original = {
        Vek_Flip = {
            "Vek's got no clue what just hit it.",
            "Bastard's not even sure which way's up.",
            "It's disoriented. It won't see us coming",
            "Vek's confused. Hit it before it regains its senses."
        },
        Mech_Accelerate = {
            "Engine output's going up.",
            "I've got my fuel injectors working overtime.",
            "Dodging Vek should be a piece of cake now."
        },
        Mech_Overclock = {
            "Surprised to see augurs disagree, but I guess that'll happen when you dose them three times the reccomended power.",
            "Damn spotter's on a power trip again. We never agree on the best move.",
            "Ejection channels routing smoothly."
        }
    },

    Recycler = {
        Vek_Flip = {
            "The blunt force has served as a Vek repellent.",
            "Terrain beneath Vek has been engraved by Vek reorientation.",
            "Vek has been reoriented."
        },
        Mech_Accelerate = {
            "Logging accelerated growth capabilities of Mech.",
            "My Mech is experiencing formative pruning."
        },
        Mech_Overclock = {
            "Logging temporary acceleration of Vekticide protocols.",
            "Mech experiencing mild intelligence growth.",
            "My Mech has been fertilized."
        }
    },

    Repairman = {
        Vek_Flip = {
            "Interesting. The blunt force seems to have caused that Vek to lose its sense of direction.",
            "The Vek is exhibiting symptoms that may indicate a concussion."
        },
        Mech_Accelerate = {
            "Incredible. The drive frame is handling more than double the standard load.",
            "Stress points in my fuel lines are close to bursting - I should burn it as quick as I can.",
            "I'm reading minor damage to the engine chambers from the fuel injectors..."
        },
        Mech_Overclock = {
            "I almost wish I could talk to the augur processors. When they act up and disagree like this, they almost seem sentient.",
            "My targeting matrix seems to think it understands the best course of action better than me. It... probably does.",
            "All augur units online, total operating output almost double baseline."
        }
    },

    Soldier = {
        Vek_Flip = {
            "The Vek aren't as steady as our Mechs.",
            "Target disoriented.",
            "Vek's confused."
        },
        Mech_Accelerate = {
            "Motors operating at almost double torque. Holding steady.",
            "Fuel line pumps accelerating.",
            "Fuel injectors prepping for hypercombustion."
        },
        Mech_Overclock = {
            "Cycling bay ready for a barrage, commander.",
            "Ejection channels cleared and primed."
        }
    },

    Warrior = {
        Vek_Flip = {
            "Vek sensory components malfunctioning.",
            "Vek internal compass misaligned."
        },
        Mech_Accelerate = {
            "Fuel distribution components performing admirably.",
            "Strain on drive frame violates workplace safety protocols.",
            "Deadly motor torque detected in joint components. Submitting request for hazard pay."
        },
        Mech_Overclock = {
            "Prediction and scouting components behaving insubordinate. Submitting request for discharge.",
            "Augur disagreement detected. Enforcing workplace conflict resolution protocols.",
            "Cycling and ejection ports cleared for service."
        }
    },

    Youth = {
        Vek_Flip = {
            "Haha! That Vek got spun around!",
            "Good luck keeping your footing, ugly!",
            "We're getting all topsy-turvy on that Vek!"
        },
        Mech_Accelerate = {
            "Wheeee!",
            "#self_mech's ready to run!",
            "We're moving quick now!"
        },
        Mech_Overclock = {
            "#self_mech's getting angry!",
            "Come at me, uglies!",
            "My #self_mech's ready to rumble!"
        }
    },


    -----------
    -- Alien --
    -----------

    Mantis = {
        Vek_Flip = {
            "Vk...; Kch'ch'kt"
        },
        Mech_Accelerate = {
            "Jjk'kt'ch'kht."
        },
        Mech_Overclock = {
            "Jjk'ch'ch'kht! CH'KT!"
        }
    },

    Rock = {
        Vek_Flip = {
            ":: ...rhnn-k-kkk-rn...? K-hnh. ::"
        },
        Mech_Accelerate = {
            ":: HnnNH. ::"
        },
        Mech_Overclock = {
            ":: Hnnnh-HrnNN. ::"
        }
    },

    Zoltan = {
        Vek_Flip = {
            "|| :-::-: ||"
        },
        Mech_Accelerate = {
            "/ -::.::- \\"
        },
        Mech_Overclock = {
            "// -::-::- \\\\"
        }
    }
}
