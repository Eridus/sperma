local Players = game:GetService("Players")

-- Tworzymy funkcję do robienia zarysów
function DrawOutline(player)
  -- Pobieramy pozycję gracza
  local position = player.Character.HumanoidRootPart.Position
  -- Tworzymy obiekt typu Part
  local part = Instance.new("Part")
  -- Ustawiamy pozycję i rozmiar części
  part.Position = position
  part.Size = Vector3.new(0.1, 0.1, 0.1)
  -- Ustawiamy kolor części na biały
  part.Color = Color3.new(1, 1, 1)
  -- Tworzymy obiekt typu Mesh
  local mesh = Instance.new("SpecialMesh")
  -- Ustawiamy typ siatki na Box
  mesh.MeshType = Enum.MeshType.Box
  -- Ustawiamy rozmiar siatki na rozmiar części
  mesh.Scale = part.Size
  -- Dołączamy siatkę do części
  part.Mesh = mesh
  -- Wyświetlamy część
  part:SetActive(true)
  -- Po 1 sekundzie usuwamy część
  task.delay(1, function()
    part:Destroy()
  end)
end

-- Przechodzimy przez wszystkich graczy
for _, player in pairs(Players:GetPlayers()) do
  -- Robimy zarys gracza
  DrawOutline(player)
end
