using Godot;
using System;

public class Player : KinematicBody2D
{
	[Export]
	public int moveSpeed = 250;
	public override void _PhysicsProcess(float delta)
	{
		Vector2 vel = new Vector2();
		vel.x = Input.GetActionStrength("move_right") - Input.GetActionStrength("move_left");
		vel.y = Input.GetActionStrength("move_down") - Input.GetActionStrength("move_up");

		MoveAndCollide(vel.Normalized() * moveSpeed * delta);
	}
}