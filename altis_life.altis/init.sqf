//Map Obeject Removal By: Raelon Masters
_markersArray = ["remove_1","remove_2","remove_3","remove_4","remove_5","remove_6","remove_7","remove_8","remove_9","remove_10","remove_11","remove_12","remove_13","remove_14","remove_15"];
_i=0;
{
    _marker = _markersArray select _i;
    _terrainobjects=nearestTerrainObjects [(getMarkerPos _marker),[],(getmarkersize _marker)select 0];
    _i=_i+1;
    {hideObjectGlobal _x} foreach _terrainobjects;
} forEach _markersArray;

StartProgress = false;

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;
