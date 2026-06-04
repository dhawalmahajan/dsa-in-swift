//
//  File.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 04/06/26.
//

import Foundation

// MARK: - Command Interface

protocol Command {
    func execute()
    func undo()
}

// MARK: - Receivers

class Light {
    func on() {
        print("Light is ON")
    }

    func off() {
        print("Light is OFF")
    }
}

class Fan {
    func on() {
        print("Fan is ON")
    }

    func off() {
        print("Fan is OFF")
    }
}

// MARK: - Concrete Commands

final class LightCommand: Command {
    private let light: Light

    init(light: Light) {
        self.light = light
    }

    func execute() {
        light.on()
    }

    func undo() {
        light.off()
    }
}

final class FanCommand: Command {
    private let fan: Fan

    init(fan: Fan) {
        self.fan = fan
    }

    func execute() {
        fan.on()
    }

    func undo() {
        fan.off()
    }
}

// MARK: - Invoker

final class RemoteController {
    private let numButtons = 4

    private var buttons: [Command?]
    private var buttonPressed: [Bool]

    init() {
        buttons = Array(repeating: nil, count: numButtons)
        buttonPressed = Array(repeating: false, count: numButtons)
    }

    func setCommand(at index: Int, command: Command) {
        guard index >= 0 && index < numButtons else { return }

        buttons[index] = command
        buttonPressed[index] = false
    }

    func pressButton(at index: Int) {
        guard index >= 0 && index < numButtons else {
            print("Invalid button index")
            return
        }

        guard let command = buttons[index] else {
            print("No command assigned at button \(index)")
            return
        }

        if !buttonPressed[index] {
            command.execute()
        } else {
            command.undo()
        }

        buttonPressed[index].toggle()
    }
}

// MARK: - Client
func commandPatternDemo() {
    let livingRoomLight = Light()
    let ceilingFan = Fan()
    
    let remote = RemoteController()
    
    remote.setCommand(
        at: 0,
        command: LightCommand(light: livingRoomLight)
    )
    
    remote.setCommand(
        at: 1,
        command: FanCommand(fan: ceilingFan)
    )
    
    // Simulate button presses
    
    print("--- Toggling Light Button 0 ---")
    remote.pressButton(at: 0) // ON
    remote.pressButton(at: 0) // OFF
    
    print("\n--- Toggling Fan Button 1 ---")
    remote.pressButton(at: 1) // ON
    remote.pressButton(at: 1) // OFF
    
    print("\n--- Pressing Unassigned Button 2 ---")
    remote.pressButton(at: 2)
}
