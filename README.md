# LazyRes

An addon for the WoW Vanilla client (1.12.1) that makes resurrecting the raid after a wipe easy.

Type /lazyres (or add that command to a macro) to quickly res someone near you. Classes that can also res will be ressed before dps classes with mana, followed by dps classes without mana. The class resurrection order is Shaman/Paladin > Priest > Druid > Mage > Hunter > Warlock > Warrior > Rogue.

Players that are already being ressed will be skipped over. This uses the same functionality that underlies LunaUnitFrame's res indicators.

If you have a friendly dead target selected, /lazyres will work just like a normal res spell and cast res on that target.

If you have no target selected and no dead raid member is within range, /lazyres will cast the Resurrect spell awaiting target selection. That way you can still select targets manually.