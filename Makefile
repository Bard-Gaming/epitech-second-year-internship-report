##
## EPITECH PROJECT, 2025
## Tek2 Internship Report
## File description:
## Makefile to build report
##

NAME = internship_report.pdf

SRC = src/$(NAME:.pdf=.tex)


.PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	@echo "Building $@..."
	@pdflatex $(SRC) &> /dev/null
	@echo "Successfully built $@"

clean:
	@rm -f $(NAME:.pdf=.aux)
	@rm -f $(NAME:.pdf=.log)
	@rm -f $(NAME:.pdf=.toc)
	@rm -f texput.log

fclean: clean
	@rm -f $(NAME)

re: fclean all
