local references = {
    aimware = gui.Reference("MENU"),
};

local windowW, windowH = 250, 450

local window = gui.Window("an_crosshair", "Crosshair Settings By AnAnAn", 100, 150, windowW, windowH);
local size = gui.Slider(window, "crosshairsize", "Crosshair Size", 4, 0, 100 )
local hickness = gui.Slider(window, "crosshairthickness", "Crosshair Thickness", 1, 0, 100,0.1 )
local spacing = gui.Slider(window, "crosshairtspacing", "Crosshair Gap", 0, -100, 100 )
local outlinethickness = gui.Slider(window, "crosshairoutlinethickness", "Crosshair Outline", 1, 0, 3,0.1 )
local dot = gui.Checkbox(window, 'crosshairdot', 'Center Dot', 1);
local t = gui.Checkbox(window, 'crosshairt', 'T Style', 0);
local style = gui.Checkbox(window, 'crosshairstyle', 'Dynamic Crosshair', 0);
local crosshairColor = gui.ColorPicker(window, "crosshaircolor","Crosshair Color",  20, 220, 20, 180);
local retrybt = gui.Button(window, "Apply Crosshair", function()
    r1,g1,b1,a1 = crosshairColor:GetValue();
    client.Command("cl_crosshairsize " .. size:GetValue()); 
    client.Command("cl_crosshairthickness " .. hickness:GetValue()); 
    client.Command("cl_crosshairgap " .. spacing:GetValue()); 
    client.Command("cl_fixedcrosshairgap " .. spacing:GetValue()); 
    client.Command("cl_crosshair_drawoutline 1"); 
    client.Command("cl_crosshair_outlinethickness " .. outlinethickness:GetValue());  
    client.SetConVar("cl_crosshairalpha", a1, true); 
    client.SetConVar("cl_crosshaircolor_b", b1, true); 
    client.SetConVar("cl_crosshaircolor_r", r1, true); 
    client.SetConVar("cl_crosshaircolor_g", g1, true); 
    if dot:GetValue() == true then
    client.SetConVar("cl_crosshairdot", 1, true); 
    elseif dot:GetValue() == false then
    client.SetConVar("cl_crosshairdot", 0, true); 
    end
    if t:GetValue() == true then
    client.SetConVar("cl_crosshair_t", 1, true); 
    elseif t:GetValue() == false then
    client.SetConVar("cl_crosshair_t", 0, true); 
    end
    if style:GetValue() == true then
    client.SetConVar("cl_crosshairstyle", 5, true); 
    elseif style:GetValue() == false then
    client.SetConVar("cl_crosshairstyle", 4, true); 
    end
end)


callbacks.Register("Draw", function()
    window:SetActive(references.aimware:IsActive());
end);
