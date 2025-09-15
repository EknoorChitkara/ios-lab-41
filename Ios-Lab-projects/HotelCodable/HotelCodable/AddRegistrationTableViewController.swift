//
//  AddRegistrationTableViewController.swift
//  HotelCodable
//
//  Created by Eknoor on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTableViewController, didSelectRoomType roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDate: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDate: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var noOfAdultsLabel: UILabel!
    @IBOutlet weak var noOfAdultsStepper: UIStepper!
    
    @IBOutlet weak var noOfChildrensLabel: UILabel!
    @IBOutlet weak var noOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var noOfNightsLabel: UILabel!
    @IBOutlet weak var noOfNightsDescription: UILabel!
    @IBOutlet weak var totalRoomPriceLabel: UILabel!
    @IBOutlet weak var roomPriceDescription: UILabel!
    
    @IBOutlet weak var wifiPriceLabel: UILabel!
    @IBOutlet weak var wifiDescription: UILabel!
    @IBOutlet weak var totalCharges: UILabel!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    let chargesSectionIndexPath = IndexPath(row: 0, section: 5)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var showChargesSection = false
    
    var roomType: RoomType?
    
    var registration: Registration?{
        guard let roomType = roomType else { return nil }
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = self.checkInDatePicker.date
        let checkOutDate = self.checkOutDatePicker.date
        let noOfAdults = Int(noOfAdultsStepper.value)
        let noOfChildren = Int(noOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName, lastName: lastName, email: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numOfAdults: noOfAdults, numOfChildren: noOfChildren, wifi: hasWifi, roomType: roomType)
    }

    var viewRegistration: Registration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        checkOutDatePicker.minimumDate =  Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)!
        
        updateNumbersOfGuests()
        updateDatePicker()
        updateRoomType()
        
        if let registration = viewRegistration{
            updateUIViewRegistration(registration);
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    func updateDatePicker(){
        checkInDate.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDate.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateNumbersOfGuests(){
        noOfAdultsLabel.text = "\(Int(noOfAdultsStepper.value))"
        noOfChildrensLabel.text = "\(Int(noOfChildrenStepper.value))"
        
    }
    
    func updateRoomType(){
        if let roomType = roomType{
            roomTypeLabel.text = roomType.name
            calculateBill()
        }else{
            roomTypeLabel.text = "Not Set"
        }
    }
    
    func calculateBill() {
        guard let roomType = roomType else { return }
        let noOfNights = Calendar.current.dateComponents([.day], from: checkInDatePicker.date, to: checkOutDatePicker.date).day ?? 0
       
        let roomPrice = Double(noOfNights) * roomType.price
        var wifiPrice = 0.0
        if wifiSwitch.isOn {
            wifiPrice = Double(noOfNights) * 10.0
        }
        let totalPrice = roomPrice + wifiPrice

        wifiPriceLabel.text = "$\(wifiPrice)"
        totalCharges.text = "$\(totalPrice)"
        noOfNightsLabel.text = "\(noOfNights)"

        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        let checkInString = formatter.string(from: checkInDatePicker.date)
        let checkOutString = formatter.string(from: checkOutDatePicker.date)
        
        noOfNightsDescription.text = "\(checkInString) - \(checkOutString)"
        totalRoomPriceLabel.text = "$\(roomPrice)"
        roomPriceDescription.text = "\(roomType.name) @ $\(roomType.price)/night"
        if !showChargesSection {
            showChargesSection = true
            tableView.beginUpdates()
            tableView.reloadSections(IndexSet(integer: 5), with: .fade)
            tableView.endUpdates()
        }
    }
    
    func updateUIViewRegistration(_ registration: Registration) {
        firstNameTextField.text = registration.firstName
        lastNameTextField.text = registration.lastName
        emailTextField.text = registration.email

        checkInDatePicker.date = registration.checkInDate
        checkOutDatePicker.date = registration.checkOutDate

        noOfAdultsStepper.value = Double(registration.numOfAdults)
        noOfChildrenStepper.value = Double(registration.numOfChildren)

        roomType = registration.roomType
        wifiSwitch.isOn = registration.wifi

        // Update dependent UI
        updateNumbersOfGuests()
        updateDatePicker()
        updateRoomType()

        // Disable editing if it's view-only
        firstNameTextField.isEnabled = false
        lastNameTextField.isEnabled = false
        emailTextField.isEnabled = false
        checkInDatePicker.isEnabled = false
        checkOutDatePicker.isEnabled = false
        noOfAdultsStepper.isEnabled = false
        noOfChildrenStepper.isEnabled = false
        wifiSwitch.isEnabled = false

        // Disable Done button (fade look)
        doneButton.isEnabled = false
        doneButton.tintColor = .lightGray
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5 && !showChargesSection{
            return 0
        }
        
        switch indexPath{
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where isCheckOutDatePickerVisible == false:
            return 0
        case chargesSectionIndexPath where !showChargesSection:
                return 0
        default :
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath
        {
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 5 && !showChargesSection {
            return 0.01
        }
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 5 {
            return showChargesSection ? "Charges" : nil
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false{
            isCheckInDatePickerVisible.toggle()
        }else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false{
            isCheckOutDatePickerVisible.toggle()
        }else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath{
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        }else{
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumbersOfGuests()
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDatePicker()
    }

    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTableViewController? {
        let selectedRoomTypeController = SelectRoomTableViewController(coder: coder)
        selectedRoomTypeController?.delegate = self
        selectedRoomTypeController?.roomType = roomType
        
        return selectedRoomTypeController
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        //later
        
    }
    
}
