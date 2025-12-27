##
## EPITECH PROJECT, 2025
## Tek2 Internship Report
## File description:
## Makefile to build report
##

NAME = internship_report.pdf

ENTRY = src/$(NAME:.pdf=.tex)

SRC_FILES = $(ENTRY)									\
			src/cover_pages/context_cover.tex			\
			src/cover_pages/mission_cover.tex			\
			src/cover_pages/report_cover.tex			\
			src/utils/cover_page_env.tex				\
			src/context.tex								\
			src/foreword.tex							\
			src/mission.tex								\
			src/table_of_contents.tex					\


.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(SRC_FILES)
	@printf "\033[33m%s\033[0m\n" "Building $@..."
	@printf "  \033[33m%s\033[0m\n" "Building base file..."
	@pdflatex $(ENTRY) > /dev/null <<< '' || (printf "  \033[31m%s\033[0m\n" "Failure. Logs available at $(NAME:.pdf=.log)" && false)
	@printf "  \033[33m%s\033[0m\n" "Building page references..."
	@pdflatex $(ENTRY) > /dev/null  # run a second time for LastPage
	@printf "\033[32m%s\033[0m\n" "Successfully built $@"

clean:
	@rm -f $(SRC_FILES:.tex=.aux)
	@rm -f $(NAME:.pdf=.aux)
	@rm -f $(NAME:.pdf=.log)
	@rm -f $(NAME:.pdf=.toc)

fclean: clean
	@rm -f $(NAME)

re: fclean all
