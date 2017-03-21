bg = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "DB6354"

padding = 40
scrollOffset = -40


cardComp = new PageComponent
	width: Screen.width
	height: 1000
	backgroundColor: ""
	scrollVertical: false
	point: Align.center
	contentInset: 
		right: padding

pagewidth = cardComp.width / 1.5

cards = []


#Kanit font
Utils.insertCSS('@import url(https://fonts.googleapis.com/css?family=Kanit);')

#Content for cards

cardContent = [
	{ title: "Go Ride"},
	{ title: "Go Messenger" },
	{ title: "Go Mart" },
	{ title: "Go Shop"}
]
cards = []

for c, i in cardContent
	card = new Layer
		height: 700
		width: pagewidth
		backgroundColor: "#fff"
		hueRotate: i * 30 - 30
		x: (pagewidth + padding) * i + padding + padding
		y: Align.center
		name: "card #{i}"
		borderRadius: 20
		parent: cardComp.content
		color: "#555"
		opacity: 0.5
		scale: 0.8
		shadowY: 0
		shadowBlur: 0
		shadowColor: "rgba(0,0,0,0.2)"
		
	card.states =
		active:
			opacity: 1
			scale: 1
			shadowY: 10
			shadowBlur: 10
			options:
				time: 0.2
		
		default:
			opacity: 0.5
			scale: 0.8
			shadowY: 0
			shadowBlur: 0
			options:
				time: 0.2
		
	cards.push (card)
	
	headerbg = new Layer
		parent: card
		width: card.width - 50
		x: Align.center
		y: 25
		borderRadius: 20
		backgroundColor: Color.random
	
	header = new Layer
		parent: headerbg
		width: headerbg.width - 80
		height: headerbg.height - 130
		point: Align.center
		backgroundColor: ""
		html: c.title
		style: 
			textTransform: "uppercase"
			fontFamiy: "'Kanit', sans-serif"
			fontSize: "32px"
			fontWeight: "800"
			lineHeight: "60px"
			textAlign: "center"

cardComp.snapToPage(cardComp.content.children[0])
cardComp.content.children[0].states.switchInstant "active"
cardComp.onChange "currentPage", ->
	card.states.switch("default") for card in cards
	current = cardComp.horizontalPageIndex(cardComp.currentPage)
	cards[current].states.switch("active")
	
